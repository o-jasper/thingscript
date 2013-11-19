#!/bin/bash

# TODO apply thingscript to its own help output.
# (change THINGSCRIPT_PATH for the different output.

#Generate docs using a thingscript file and the respective help file
# Place an indicator if the help file doesnt exist.

cd $2

list_local_files()
{
    ls $1 | grep -v readme.md |grep -v index.html | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then #If it is a file, link to it.
            echo '<a href="'$line/index.html'">'$line'</a>(subdir)<br>' 
        else #TODO check if it is a command.
            echo '<a href="'$line.html'">'$line'</a><br>' 
        fi 
    done
}

hfile()
{   
    md=$1 
    #Messy...
    export BACKDIR=$(echo $md | tr '/' '\n' | tail -c+8 | while read line; do
            echo -n ../
            done | tail -c+4)
    
    if [ ! -e $md ]; then
        echo $1 'does not have documentation (yet?)'
        mkdir -p help/tso/
        echo $1 >> help/tso/missing
        return
    fi

    export THINGSCRIPT_ADDITIONAL_PATH="/home/$USER/.thingscript_share/helpmaker:"
    thingscript markdown_handle $md
    
    if [ "$(basename $md)" == "readme.md" ]; then  #If a directory, list other files there,
        echo -n '<h4>Directory contains:</h4>'
        echo -n '<a href="../index.html">..</a> (parent directory)<br>'
        list_local_files $(dirname $1)
    else #If it is a file, link to the directory.
        echo '<br><a href="index.html">'other things in directory
        echo -n $(dirname $md | tail -c+6)'</a><br>'
    fi
}

#Input a directory
all()
{
    mkdir -p tso/html/$1
    echo "$2$1"
    one $1 > /dev/null
    ls $1 |grep -v tso | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then
            all $1/$line "$2 "
        else #TODO check if it is a command.
            echo "$2$line"
            one $1/$line
        fi 
    done
}

one()
{   test -d help/$1
    if [ "$?" == "0" ]; then #Its a directory, use the readme there.
        md=help/$1/readme.md
        out=tso/html/$1/index.html
        mkdir -p tso/html/$1
        echo "<h2>Directory: $1</h2>" > $out
        hfile $md >> $out
    else
        md=help/$1
        out=tso/html/$1.html
        mkdir -p $(dirname tso/html/$1)
        echo "<h2>File: $1</h2>" > $out
        hfile $md >> $out
    fi
}

if [ "$1" == "all" ]; then
    rm help/tso/missing
    all .
    #All the commands.
    for el in $(echo "get exec get_page get_image help help_browser
 mk version handle handle_get markdown_handle cat_get url ibin" |tr ' ' '\n'); do
        one $el
    done
else
    one $1
fi
