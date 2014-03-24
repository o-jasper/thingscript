// Copyright (C) 25-11-2013 Jasper den Ouden. GPLv3

var cur_gal_file;
var cur_gal_action_file;
var main_image;

function to_img_re_url(file,action_file)
{   
    var to_ind = location.href.indexOf("#img_");
    if( to_ind != -1 )
    {   location.href = location.href.substr(0,to_ind) + "#img_" + file; }
    else
    {   location.href = location.href + "#img_" + file; }
    to_img(file,action_file)
}

var designs =[]; //Dictionary of designs.

function use_action_file()
{   to_img(cur_gal_action_file); 
}

function want_w()
{   return Math.floor(window.innerWidth*0.6) + "px"; }
function want_h()
{   return Math.floor(window.innerHeight*0.6) + "px"; }
/*
function js_img(file)
{
    var viewer= document.getElementById("viewer");
    viewer.style.width = want_w();
    viewer.src=null;
    if( js_import(file + ".js") )
    {   thingiview.loadArray(designs[file]); }
    else //Wait until it is loaded.(TODO better, can you wait for something to finish?)
    {    setTimeout(function(){thingiview.loadArray(designs[file]);},500);
    }
}*/

function load_img(file)
{   thingiview.loadArray(designs[file]); }

function to_img(file,action_file)
{      
    cur_gal_file = file;
    cur_gal_action_file = action_file;
    var viewer     = document.getElementById("viewer");
    var viewer_img = document.getElementById("viewer_img");
    var ext  = file.substr(file.length-4);

    viewer.style.height= want_h();
    document.getElementById("pre_viewer").innerHTML =""; //Reset pre and post.
    document.getElementById("post_viewer").innerHTML="";
    
    if( ext==".jpg" || ext==".png" || ext==".gif" ) //Put an image there.
    {   viewer_img.innerHTML = "<img src = \"" + file + "\">";
        viewer.style.visibility = "invisible";
        viewer.style.display = "none";
        viewer.height = 0;
    }
    else if( ext.substr(1)==".js" ) //Disable image, put design.
    {   
        viewer.style.display = "";
        viewer.style.width = want_w();
        viewer.style.height = '';
        viewer_img.innerHTML = "";
        if( js_import(file) ) //Import file(returns true if we should already have it.)
        {   load_img(file); 
        }
        else //Wait until it is loaded.(TODO better, can you wait for something to finish?)
        {   setTimeout(function(){ load_img(file); },250);
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
    {   to_img(url.substr(i+5)); }
    else
    {   to_img(main_image); }
}
function gallery_initial()
{ //  viewer_prep();
 }
