was_imported=[]; //List of what is already imported.

function js_import(src)
{
//    document.getElementById("say").innerHTML = src + " " + was_imported[src];
    if( was_imported[src] == undefined )
    {   was_imported[src] = true;
        var scriptElem = document.createElement('script');
        scriptElem.setAttribute('src',src);
        scriptElem.setAttribute('type','text/javascript');
        document.getElementsByTagName('head')[0].appendChild(scriptElem);
    }
}
