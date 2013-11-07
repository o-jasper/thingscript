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
    
    if [ ! -e $md ]; then
        echo $1 'does not have documentation (yet?)'
        mkdir -p help/tso/
        echo $1 >> help/tso/missing
        return
    fi

    S=$(grep -n -F '## Related' $md |cut -f 1 -d:)
    if [ "$S" == "" ]; then
        markdown $md
    else
        head -n $(expr $S - 1) $md | markdown
        echo '<h2>Related</h2>'
        for line in $(tail -n +$(expr $S + 1) $md); do
            FIRST=''
            for el in $(echo $line | tr , '\n'); do
                if [ "$FIRST" == "" ]; then
                    FIRST=NO
                else
                    echo ,
                fi
                echo '<a href="'$line'.html">'$el'</a>'
            done
            echo '<br>'
        done
    fi
    
    if [ "$(basename $md)" == "readme.md" ]; then  #If a directory, list other files there,
        echo '<h4>Directory contains:</h4>'
        echo '<a href="../index.html">..</a> (parent directory)<br>'
        list_local_files $(dirname $1)
    else #If it is a file, link to the directory.
        echo '<br><a href="index.html">'other things in directory $(dirname $md)'</a><br>'
    fi
}

#Input a directory
all()
{
    echo $1
    one $1
    ls help/$1 | grep -v readme.md |grep -v index.html | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then 
            all $1/$line/
        else #TODO check if it is a command.
            echo ..$line
            one $1/$line
        fi 
    done
}

one()
{   test -d help/$1
    if [ "$?" == "0" ]; then #Its a directory, use the readme there.
        md=help/$1/readme.md
        mkdir -p doc/html/$1
        hfile $md > doc/html/$1/index.html
        
    else
        md=help/$1
        mkdir -p $(dirname doc/html/$1)
        hfile help/$1 > doc/html/$1.html
    fi
}

if [ "$1" == "all" ]; then
    all .
else
    one $1
fi
