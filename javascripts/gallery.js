// Copyright (C) 22-05-2013 Jasper den Ouden. GPLv3

var cur_gal_file;
var cur_gal_action_file;

function to_img_re_url(file,action_file)
{   var to_ind = location.href.indexOf("#img_");
    if( to_ind != -1 )
    {   location.href = location.href.substr(0,to_ind) + "#img_" + file; }
    else
    {   location.href = location.href + "#img_" + file; }
    to_img(file,action_file)
}

function use_action_file()
{   to_img(cur_gal_action_file); }

var designs =[]; //Dictionary of designs.

function want_w()
{   return Math.floor(window.innerWidth*0.6) + "px"; }
function want_h()
{   return Math.floor(window.innerHeight*0.6) + "px"; }

function js_img()
{
    viewer.style.width = want_w();
    viewer.src=null;
    if( js_import(file + ".js") )
    {   thingiview.loadArray(designs[file]); }
    else //Wait until it is loaded.(TODO better, can you wait for something to finish?)
    {    setTimeout(function(){thingiview.loadArray(designs[file]);},250);
    }
}

function to_img(file,action_file)
{      
    cur_gal_file = file;
    cur_gal_action_file = action_file;
    var viewer= document.getElementById("viewer");
    var ext  = file.substr(file.length-4);

    viewer.style.height= want_h();
    
    if( ext==".jpg" || ext==".png" || ext==".gif" ) //Put an image there.
    {   viewer.style.width = "";
        viewer.src=file;
    }
    else if( ext.substr(1)==".js" ) //Disable image, put design.
    {   viewer.style.width = want_w();
        viewer.src=null;
        if( js_import(file) )
        {   thingiview.loadArray(designs[file]); 
        }
        else //Wait until it is loaded.(TODO better, can you wait for something to finish?)
        {   setTimeout(function(){thingiview.loadArray(designs[file]);},250);
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
{   var i = url.indexOf("#img_");
    if( i != -1 )
    {   to_img(url.substr(i)); }
}
function gallery_initial()
{   viewer_prep(); }
