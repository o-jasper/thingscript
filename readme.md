
# Script for making a website with physibles

Thats were it started at least. Lets keep it at that for now. 
Not at all stable yet.

It uses [povray](http://povray.org/), [admesh](http://www.varlog.com/admesh-htm) 
and [thingiview.js](https://github.com/tbuser/thingiview.js)

Documentation gets into the system itself, it is in `share_thingscript/help/`.
`thingsscript help $some_command_or_thingscript_file` gets you help at it.
(not sure at the moment how good that is)

### Install
Get it with `git clone`.

Dependencies: thingiview.js is source included. If povray and admesh arent
installed, it should just fail to do the things pertaining to it. Currently it 
is basically linux (/unix-like?) only.

I dont have a proper install script that actually puts stuff in
`/usr/share/thingscript/` and `/bin/thingscript/`, so you have to do:

    cd ~
    ln -s $thingiview_dir/share_thingscript .thingscript
    PATH=$PATH:$thingiview_dir/bin #Add this to ~/bashrc for permanence.

The latter i prefer to add `PATH=$PATH:~/.bin/` to `~/.bashrc` and symlink that
to the 'binary' instead.
