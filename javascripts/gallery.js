// Copyright (C) 22-05-2013 Jasper den Ouden. GPLv3

var cur_gal_index = 1;
function to_img_re_url(index)
{   var to_ind = location.href.indexOf("#");
    if( to_ind != -1 )
    {   location.href = location.href.substr(0,to_ind) + "#img_" + index; }
    else
    {   location.href = location.href + "#img_" + index; }
    to_img(index)
}

var designs =[]; //Dictionary of designs.

function to_img(index)
{   cur_gal_index = index;
    var file = imgs[index];
    var ext  = file.substr(file.length-4);
    if( ext==".jpg" || ext==".png" || ext==".gif" ) //Put an image there.
    {   document.getElementById("viewer").src = file;
    }
    else if( ext==".stl" || ext==".obj" ) //Disable image, put design.
    {    js_import(file + ".js");
         thingiview.loadArray(designs[file]);
         document.getElementById("viewer").src = null;
    }
}

function by_url(url) //Pick image based on url.
{   var any_p=0;
    for (var i=0 ; i<imgs.length ; i++)
    {   if( url.indexOf("#img_"+i)!= -1 )
        {   to_img(i);
            any_p=1;
            break;
        }
    }
    if( any_p==0 ){ to_img(0); }
}
