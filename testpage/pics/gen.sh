#!/bin/bash

rm ../page/gallery_list
for i in {1..10}; do
    convert -background lightblue -fill blue \
        -pointsize 72 label:$i \
        $i.png
    echo $i.png >> ../thingscript/gallery_list
done
