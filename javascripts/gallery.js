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

function want_w()
{   return Math.floor(window.innerWidth*0.6) + "px"; }
function want_h()
{   return Math.floor(window.innerHeight*0.6) + "px"; }

function to_img(index)
{   cur_gal_index = index;
    var file = imgs[index];
    var viewer= document.getElementById("viewer");
    var ext  = file.substr(file.length-4);

    viewer.style.height= want_h();

    if( ext==".jpg" || ext==".png" || ext==".gif" ) //Put an image there.
    {   viewer.style.width = "";
        viewer.src=file;
    }
    else if( ext==".stl" || ext==".obj" ) //Disable image, put design.
    {   viewer.style.width = want_w();
        viewer.src=null;
        if( js_import(file + ".js") )
        {   thingiview.loadArray(designs[file]); }
        else //Wait until it is loaded.(TODO better, can you wait for something to finish?)
        {    setTimeout(function(){thingiview.loadArray(designs[file]);},250);
        }
    }
}
//Gets around thingiview resizing not all good.
function viewer_prep()
{   var viewer= document.getElementById("viewer");
    viewer.src=null;
    viewer.style.width = Math.floor(window.innerWidth*0.6) + "px";
    viewer.style.height= Math.floor(window.innerHeight*0.6) + "px";
    thingiview.loadArray([[]]);
}

function by_url(url) //Pick image based on url.
{   viewer_prep();
    
    var any_p=0;
    for (var i=0 ; i<imgs.length ; i++)
    {   if( url.indexOf("#img_"+i)!= -1 )
        {   to_img(i);
            any_p=1;
            break;
        }
    }
    if( any_p==0 ){ to_img(0); }
}
