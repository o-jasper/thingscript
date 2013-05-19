#!/bin/bash
#
#  Copyright (C) 18-05-2013 Jasper den Ouden.
#
#  This is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#

if [ "$1" == "" ]; then
    echo First argument is project directory > /dev/stderr
    exit
fi

export PROJECT_DIR=$1
export PROJECT_NAME=`basename $PROJECT_DIR`
mkdir -p $PROJECT_DIR/page/

get()
{   thingscript get $@
}
get_page()
{   thingscript get_page $@
}

#See if we have the required stuff.
MISSING=''
for el in `echo author category title`; do
    if [ "`get $el`" == "" ]; then
        MISSING=$MISSING" $el"
    fi
done
for el in `echo short_description license layout`; do
    if [ "`get_page $el`" == "" ]; then
        MISSING=$MISSING" $el"
    fi
done
if [ "$MISSING" != "" ]; then
    echo > /dev/stderr
    echo Error: For each line, one of the files is required: > /dev/stderr
    echo $MISSING | tr ' ' '\n'
    exit
fi
#(Beyond the above things are optional, missing ignored)

#Handles pages, possibly doing scripts/substitutions within.
handle()
{
    if [ "$1" == "" ]; then #Nothing here.
        return
    fi
    test -e $1
    if [ "$?" != "0" ]; then #File doesnt exist.
        exit #TODO do something?
    fi
    VAL=`echo $1 | cut -f 3 -d'.'`
    if [ "$VAL" = "" ]; then
        VAL=`echo $1 | cut -f 2 -d'.'`
    fi
    case "$VAL" in
        html)
            cat $1;;
        md)
            markdown $1;;
        html_)  #Recurse.
            cat $1 | handle_whole;;
        md_)
            markdown $1 | handle_whole ;;
        *) 
            cat $1 ;;
    esac
}

get_image()
{ 
    get $1.png $1.jpg $1.svg $1.gif
}

handle_get()
{
    handle `get_page $1`
}

DOWNLOADS=''

cat_or_run() #List 
{
    if [ "$1" == "" ]; then
        $2
    else
        cat $1
    fi
}

#TODO make handling external. (Its needed top make things elements.)
#Warning, dont use single loose words.
handle_whole()
{
    tr '$' '\n' | while read LINE; do
        FIRST=`echo "$LINE" | cut -f 1 -d ' '`
        if [ "$FIRST" == "" ]; then
            echo $LINE
            continue
        fi
        GOT=`get elements/$FIRST`
        if [ "$GOT" != "" ]; then  #Got something, yay.
            $GOT $LINE #Run it
            continue
        fi
        case "$LINE" in
            #Some things are forced to be just data.
            short_description)
                handle `get short_description` ;;
            #Various
            gallery) #Scripts.
                SCRIPT=`get scripts | grep gallery: | head -n 1 | cut -f 2 -d:`
                if [ SCRIPT=="" ]; then
                    SCRIPT=gallery.sh
                fi
                GALLERY_LIST_FILE=`get gallery_list` #TODO stream it instead?
                if [ "$GALLERY_LIST_FILE" == "" ]; then #Doesnt exist yet.
                    ls $PROJECT_NAME/pics | grep -P '(png|gif|jpg|jpeg)'\
| while read line; do echo pics/$line; done > $PROJECT_DIR/page/gallery_list 
                    GALLERY_LIST_FILE=$PROJECT_DIR/page/gallery_list
                fi
                sh `get scripts/$SCRIPT` $GALLERY_LIST_FILE;;
            git_get) #TODO fancier, click to get it into clipboard.
                echo 'Get using git: <code>git clone '`get git_link`'</code>';;
            src_list) #TODO the `ls` is _farrrr_ from comprehensive.
                RUN='ls $PROJECT_DIR/src/* $PROJECT_DIR/*.blender
 $PROJECT_DIR/*.skp $PROJECT_DIR/*.scad $PROJECT_DIR/*.escad'
                cat_or_run `get output_list` $RUN | while read line; do
                    echo '<a href="'$PROJECT_DIR/$line'">$line</a><br>'
                done ;;
            output_list) #'Binary' files from the sources
                RUN='ls $PROJECT_DIR/output/* $PROJECT_DIR/*.stl
 $PROJECT_DIR/*.obj $PROJECT_DIR/*.dxf $PROJECT_DIR/*.svg'
                cat_or_run `get output_list` $RUN | while read line; do
                    echo '<a href="'$PROJECT_DIR/$line'">$line</a><br>'
                done ;;
            inspiration) #Hmm what to do with it?
                ;;
            predecessors)
                ;;
            successors)
                ;;
            tags)
                TAGSFILE=`get tags`
                echo '<span class="tag">'`head -n 1 $TAGSFILE`'</span> '
                tail -n+2 $TAGSFILE | while read TAG; do
                    echo ', <span class="tag">'$TAG'</span>'
                done;
                ;;
            zip_file)
                DOWNLOADS=$DOWNLOADS"
zip"
                echo '"downloads/'$PROJECT_NAME.zip'"' ;;
            tar_gz_file)
                DOWNLOADS=$DOWNLOADS"
tar.gz"
                echo '"downloads/'$PROJECT_NAME.tar.gz'"' ;;
            tar_bz2_file)
                DOWNLOADS=$DOWNLOADS"
tar.bz2"
                echo '"downloads/'$PROJECT_NAME.tar.bz2'"' ;;
            torrent)
                DOWNLOADS=$DOWNLOADS"
torrent"
                echo '"downloads/'$PROJECT_NAME.torrent'"' ;;
            download)
                handle_get widget/download ;;
            download_icon)
                echo \"`get_image widget/pic/download`\";;
            img) #Some arbitrary layout image.
                FROM=`echo $LINE | cut -f2 -d':'`
                echo \"`get_image $FROM`\";;
            *_) #Layout stuff.
                handle_get `echo $LINE | head -c-2` ;;
            *.sh) #Scripts.
                SCRIPTFILE=`get scripts/$FIRST`
                if [ "$SCRIPTFILE" == "" ]; then
                    echo Could not find this script: $FIRST> /dev/stderr
                fi
                ARGS=`echo $LINE |cut -f2- -d' '`
                sh $SCRIPTFILE $ARGS ;;
            :*) #Some pages.
                handle_get `echo $LINE | tail -c+2`;;
            *)
                echo $LINE ;;
        esac
    done
}

handle_get layout > $PROJECT_DIR/page.html
