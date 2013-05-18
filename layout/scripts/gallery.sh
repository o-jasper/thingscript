#!/bin/bash
#
#  Copyright (C) 18-05-2013 Jasper den Ouden.
#
#  This is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#

#Lays out a list of the images in javascript.
echo '<script>
var imgs = ["'`head -n 1 $1`'"'
for el in `tail -n+2 $1`; do
    echo ',"'$el'"'
done
#Ends the list and some functions to switch to images.
echo '];
var designs =[];'
for el in `grep -P '.+\.(stl|obj)' $1`; do #TODO overly specific
    mkdir -p design_js/
    bel=`basename $el`
    echo 'designs["'$el'"]='`sh otherscripts/json_file.sh testpage/$el`';' >  design_js/$bel.js
    echo '</script>
<script src="'../design_js/$bel.js'"></script>
<script>'
done

echo '
var cur_gal_index = 1;
function to_img_re_url(index)
{   var to_ind = location.href.indexOf("#");
    if( to_ind != -1 )
    {   location.href = location.href.substr(0,to_ind) + "#img_" + index; }
    else
    {   location.href = location.href + "#img_" + index; }
    to_img(index)
}

function to_img(index)
{   cur_gal_index = index;
    var file = imgs[index];
    var ext  = file.substr(file.length-4);
    if( ext==".jpg" || ext==".png" || ext==".gif" ) //Put an image there.
    {   document.getElementById("viewer").src = file;
    }
    else if( ext==".stl" || ext==".obj" ) //Disable image, put design.
    {  thingiview.loadArray(designs[file]);
       document.getElementById("viewer").src = null;
    }
}
</script>'

#Lays out the main image and...
FIRST=`head -n 1 $1`
echo '<img id="viewer" style="width:400px;height:400px">'
I=0
echo '<table><tr>'
for el in `cat $1`; do
#TODO generate image from 3d models.
    echo '<td><img onclick="to_img_re_url('$I')" src="'$el'"></td>'
    I=`expr $I + 1`
done
# ...a set of images with which to navigate.
echo '</tr></table>
<script>
var any_p =0;
for (var i=0 ; i<imgs.length ; i++)
{   if( location.href.indexOf("#img_"+i)!= -1 )
    {   to_img(i);
        any_p=1;
        break;
    }
}
if( any_p==0 ){ to_img(0); }
</script>'

