#!/bin/bash

#TODO
# * Check if it is a command
# * Detect `thingscript ` command use and use it as ques to link there?
# * Cut up 'h1' (single '# ') for treatment of their content 
#   (for instance give 'see also' section links.)
# * Freaking messing with directories :/

hfile()
{
    S=$(grep -n -F '## Related' $1 |cut -f 1 -d:)
    if [ "$S" == "" ]; then
        markdown $1
    else
        head -n $(expr $S - 1) $1 | markdown
        echo '<h2>Related</h2>'
        for line in $(tail -n +$(expr $S + 1) $1); do
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
}

handle()
{
    echo $2/$1
    mkdir -p $2/$1/
    hfile $1/readme.md > $2/$1/index.html
    echo '<h4>This directory contains:</h4>' >> $2/$1/index.html
    if [ "$3" == "yes" ]; then
        echo '<a href="../index.html">..</a> (parent directory)<br>' >> $2/$1/index.html
    fi
    ls $1 | grep -v readme.md |grep -v index.html | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then #If it is a file, link to it.
            echo '<a href="'$line/index.html'">'$line'</a>(subdir)<br>' >> $2/$1/index.html
            handle $1/$line $2 yes
        else #TODO check if it is a command.
            echo '<a href="'$line.html'">'$line'</a><br>' >> $2/$1/index.html
            hfile $1/$line > $2/$1/$line.html
            echo '<br><hr><a href="index.html">Directory it is in</a>' >> $2/$1/$line.html
        fi 
    done
}
handle $1 $2
