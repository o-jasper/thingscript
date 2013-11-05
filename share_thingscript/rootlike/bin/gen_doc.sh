#!/bin/bash

handle()
{
    echo $2/$1
    mkdir -p $2/$1/
    markdown $1/readme.md > $2/$1/index.html
    echo '<h4>This directory contains:</h4>' >> $2/$1/index.html
    if [ "$3" == "yes" ]; then
        echo '<a href="../index.html">..</a> (parent directory)<br>' >> $2/$1/index.html
    fi
    ls $1 | grep -v readme.md |grep -v index.html | while read line ; do
        test -d $1/$line
        if [ "$?" == "0" ]; then #If it is a file, link to it.
            echo '<a href="'$line/index.html'">'$line'</a>(subdir)<br>' >> $2/$1/index.html
            handle $1/$line $2 yes
        else
            echo '<a href="'$line.html'">'$line'</a><br>' >> $2/$1/index.html
            markdown $1/$line > $2/$1/$line.html
            echo '<br><hr><a href="index.html">Directory it is in</a>' >> $2/$1/$line.html
        fi 
    done
}
handle $1 $2
