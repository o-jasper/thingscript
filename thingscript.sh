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
    echo First argument is project directory
    exit
fi

PROJECT_DIR=$1
PROJECT_NAME=`basename $PROJECT_DIR`
mkdir -p $PROJECT_DIR/page/

MISSING=''

#Gets page information.
page_get()
{
    for el in `echo $@`; do
        test -e $PROJECT_DIR/page/$el
        if [ "$?" == "0" ]; then 
            echo $PROJECT_DIR/page/$el
            return #Have one.
        fi
    done
    MISSING=$MISSING"page: $@,"
}
#Gets a page, this may mean various formats.
page_get_page()
{ 
    page_get $1.html $1.md $1.html_ $1.md_ $1
}

#Dont know why the double loop didnt work, bash sucks.
layout_locations()
{
    for el in `echo $@`; do
        echo $PROJECT_DIR/layout/$el
    done
    for el in `echo $@`; do
        echo ~/.thingscript/layout/$el
    done
    for el in `echo $@`; do
        echo /etc/thingscript/layout/$el
    done
}

#Gets layout information.
layout_get()
{   for el in `layout_locations $@`; do
        test -e $el
        if [ "$?" == "0" ]; then 
            echo $el
            return #Have one.
        fi
    done
    MISSING=$MISSING"layout: $@,"
}
#Gets a page, one of various formats.
layout_get_page()
{
    layout_get $1.html $1.md $1.html_ $1.md_ $1
}

#Layout and general stuff.
layout_get_page layout > /dev/null
layout_get_page author > /dev/null

#Project stuff.
page_get_page author > /dev/null
page_get category > /dev/null
page_get title > /dev/null
page_get_page short_description > /dev/null
#page_get short_description.md short_description.html\ #was there a reason?
# short_description.md_ short_description.html_ \
#page/description.md page/description.html \
#page/description.md_ page/description.html_ > /dev/null
page_get_page license > /dev/null
#The above may not be missing.
if [ "$MISSING" != "" ]; then
    echo > /dev/stderr
    echo Error: For each line, one of the files is required: > /dev/stderr
    LEFT=$MISSING
    while [ "$LEFT" != "" ]; do
        echo " " $LEFT | cut -f1 -d,
        LEFT=`echo $LEFT | cut -f2- -d,`
    done
    exit
fi
#(Beyond the above things are optional, missing ignored)

handle_page()
{   handle $@
}

#TODO write proper comment here.
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

handle_page_get()
{
    handle `page_get $1.html $1.md $1.html_ $1.md_ $1`
}
page_get_image()
{ 
    page_get $1.png $1.jpg $1.svg $1.gif
}

handle_layout_get()
{
    handle `layout_get $1.html $1.md $1.html_ $1.md_ $1`
}

layout_get_image()
{ 
    layout_get $1.png $1.jpg $1.svg $1.gif
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

handle_whole()
{
    tr '$' '\n' | _handle_whole 
}

#Warning, dont use single loose words.
_handle_whole()
{
    while read LINE; do
        case "$LINE" in
            thingiview_prep) #Prepare for thingiviewer.
                echo '
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  
<script src="../javascripts/Three.js"></script>
<script src="../javascripts/plane.js"></script>
<script src="../javascripts/thingiview.js"></script>

  <script>
    window.onload = function() {
      thingiurlbase = "../javascripts";
      thingiview = new Thingiview("viewer");
      thingiview.setObjectColor('\'\#C0D8F0\'');
      thingiview.initScene();
    }
  </script>';;
            logo)
                echo '"'`layout_get_image pics/logo`'"';;
            #Some things are forced to be just data.
            category)
                cat `page_get category`;;
            title)
                cat `page_get title`;;
            link)
                cat `page_get link`;;
            author) #Author
                cat `page_get author` ;;
            author_img)
                echo '"'`page_get_image pics/author`'"';;
            author_link)
                LINKFILE=`page_get link`
                echo '"'`cat $LINKFILE`'"' ;;
            short_description)
                handle `page_get short_description` ;;
            #Various
            gallery) #Scripts.
                SCRIPT=`page_get scripts | grep gallery: | head -n 1 | cut -f 2 -d:`
                if [ SCRIPT=="" ]; then
                    SCRIPT=gallery.sh
                fi
                GALLERY_LIST_FILE=`page_get gallery_list` #TODO stream it instead?
                if [ "$GALLERY_LIST_FILE" == "" ]; then #Doesnt exist yet.
                    ls $PROJECT_NAME/pics | grep -P '(png|gif|jpg|jpeg)'\
| while read line; do echo pics/$line; done > $PROJECT_DIR/page/gallery_list 
                    GALLERY_LIST_FILE=$PROJECT_DIR/page/gallery_list
                fi
                sh `layout_get scripts/$SCRIPT` $GALLERY_LIST_FILE;;
            git_get) #TODO fancier, click to get it into clipboard.
                echo 'Get using git: <code>git clone '`page_get git_link`'</code>';;
            src_list) #TODO the `ls` is _farrrr_ from comprehensive.
                RUN='ls $PROJECT_DIR/src/* $PROJECT_DIR/*.blender
 $PROJECT_DIR/*.skp $PROJECT_DIR/*.scad $PROJECT_DIR/*.escad'
                cat_or_run `page_get output_list` $RUN | while read line; do
                    echo '<a href="'$PROJECT_DIR/$line'">$line</a><br>'
                done ;;
            output_list) #'Binary' files from the sources
                RUN='ls $PROJECT_DIR/output/* $PROJECT_DIR/*.stl
 $PROJECT_DIR/*.obj $PROJECT_DIR/*.dxf $PROJECT_DIR/*.svg'
                cat_or_run `page_get output_list` $RUN | while read line; do
                    echo '<a href="'$PROJECT_DIR/$line'">$line</a><br>'
                done ;;
            inspiration) #Hmm what to do with it?
                ;;
            predecessors)
                ;;
            successors)
                ;;
            tags)
                TAGSFILE=`page_get tags`
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
                handle_layout_get widget/download ;;
            download_icon)
                echo \"`layout_get_image widget/pic/download`\";;
            layout_img) #Some arbitrary layout image.
                FROM=`echo $LINE | cut -f2 -d':'`
                echo \"`layout_get_image $FROM`\";;
            *_) #Layout stuff.
                handle_layout_get `echo $LINE | head -c-2` ;;
            *.sh) #Scripts.
                sh `layout_get scripts/$LINE`;;
            :*) #Some pages.
                handle_page_get `echo $LINE | tail -c+2`;;
            *)
                echo $LINE ;;
        esac
    done
}

handle_layout_get layout > $PROJECT_DIR/page.html
