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

#See if we have the required stuff.
MISSING=''
for el in `echo author category title`; do
    if [ "`thingscript get $el`" == "" ]; then
        MISSING=$MISSING" $el"
    fi
done
for el in `echo short_description license layout`; do
    if [ "`thingscript get_page $el`" == "" ]; then
        MISSING=$MISSING" $el"
    fi
done
if [ "$MISSING" != "" ]; then
    echo > /dev/stderr
    echo Error: For each line, _one_ of the files is required: > /dev/stderr
    echo $MISSING | tr ' ' '\n'
    echo
    echo Use \`thingscript get help/\$FILE\` for information about the file.
    exit
fi
#(Beyond the above things are optional, missing ignored)
thingscript handle_get layout > $PROJECT_DIR/index.html
