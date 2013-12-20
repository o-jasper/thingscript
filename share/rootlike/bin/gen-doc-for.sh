#!/bin/bash
#Generate docs using a thingscript file and the respective help file
# Place an indicator if the help file doesnt exist.

#TODO needs to search down a THINGSCRIPT_PATH instead.

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
        echo $md 'does not have documentation (yet?) '
        if [ "$2" != "" ]; then
            echo 'here is the top of that file:<br><br><code>'
            head $2 | strings | sed '$a\\n' | while read line; do echo "$line"'<br>'; done
            echo '</code>'
            #TODO 'missing files' page?
            mkdir -p help/tso/
            echo $1 >> help/tso/missing
            return
        fi
    fi

    export THINGSCRIPT_PATH="/home/$USER/.thingscript_share/helpmaker:/home/$USER/.thingscript_share/main"
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

#Input a directory. (TODO really should also look in help directory?)
all()
{
    mkdir -p tso/html/$1
    echo "$2$1"
    one $1 > /dev/null
    ls $1 |grep -v tso | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then
            if [ "$1" != "."  -o "$line" != "help" ]; then
                all $1/$line "$2 "
            fi
        else #TODO check if it is a command.
            echo -n "$2$line: "
            one $1/$line
        fi 
    done
}

one()
{   echo help/$1
    test -d help/$1
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
        hfile $md $1 >> $out
    fi
}

if [ "$1" == "all" ]; then
    rm help/tso/missing
    rm -r tso/html/
    all . ""
    #All the commands.
    for el in $(ls help/*/* help/*/*/* help/*/*/*/* -d | grep -v readme.md); do
        would_refer=$(echo $el | tail -c+6)
        if [ ! -e $would_refer ]; then
            one $would_refer
        fi
    done
    hfile help/commands/readme.md > tso/html/commands/index.html
    hfile help/concepts/readme.md > tso/html/concepts/index.html
    hfile help/vars/readme.md > tso/html/vars/index.html
else
    one $1
fi
