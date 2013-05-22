#!/bin/bash
#
#  Copyright (C) 22-05-2013 Jasper den Ouden.
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

thingscript handle `get_page layout` > $PROJECT_DIR/page.html
