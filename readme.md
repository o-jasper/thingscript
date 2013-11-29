
# Script that generates a page for 
For linux(perhaps macosx/unix too) currently. 

## Features
* Really very general. Much more general than just this case.
* Creates files to be used by [thingtracker](http://thingtracker.net/).(not well tested)
* `.stl` and `.obj` viewing using
  [thingiview.js](https://github.com/tbuser/thingiview.js).(the precalculated approach)
  `.stl` model preview using [povray](http://povray.org/), [stl2pov](http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html"), and [admesh](http://www.varlog.com/admesh-htm) 
  a bit to figure out the location.(some of those may take long, it checks the timestamps)

* Configurable, but with good defaults. Sequence of overriding preferences means 
  that you can change behavior, or provide behavior as defaults.

  A sufficiently high power user is indistinguishable from a developper, *no* 
  language is special in extending this, everything is executed as if it is a
  program.(other than it being an extra dependency of course)

* Good documentation, build into the system itself but also in the form of static
  html, which can be generated using the thingscript itself. 
  (`thingscript help`,`thingscript help_browser`) Users can document their
  own stuff too, just plunk the file in at the correct location.

* If you expose the input of the program to the internet, its incredibly insecure.

### Install
Get it with `git clone https://github.com/o-jasper/thingscript`.

Dependencies: `thingiview.js` is source included. If `povray` and `admesh` arent
installed, it should just fail to do the things pertaining to it. Currently it 
is basically linux (/unix-like?) only.

I dont have a proper install methods that actually puts stuff in
`/usr/share/thingscript/` and `/bin/thingscript/`,(yet) so you have to do:

    cd ~
    ln -s $thingiview_dir/share_thingscript .thingscript
    PATH=$PATH:$thingiview_dir/bin #Add this to ~/.bashrc for permanence.

The latter i prefer to add `PATH=$PATH:~/.bin/` to `~/.bashrc` and symlink that
to the 'binary' instead, that way all the extra programs have the same place.

### Usage
Use `thingscript help_browser` or start from `share_thingscript/main/tso/html/index.html`
and browse directly.

    thingscript mk page testfile/ #Makes a representation page.
    
    thingscript mk release testfile/ name-of-this-release #Makes a release

    thingscript mk tracker testfile/ #Makes a thingtracker json file
    #Appends per-item trackers into one bigger tracker.
    thingscript mk tracker_list tracker_list_name.json : thing_directory_1 thing_directory_2

    cd testpage/; thingscript get author; thingscript cat_get author;
    cat $(thingscript get author) #Demonstrate get, cat_get

### Useful bits
Maybe some bits are useful as script in another context. Most of them will be in
`share_thingscript/main/scripts/bin/`. I try to develop them in the direction
of them being more stand-alone.(but they use `thingscript get` currently)

Conversely, bits of commandline pertaining to 3dp files can be useful for this
project.

### Todo list
There is a todo list in `todo.md`, feel free to create issues if you have
something to say on them.

## Author, license
Jasper den Ouden, under the GPLv3 currently

Help is appreciated, probably the easiest way
(requiring the least knowledge of the project itself) to help is to make
additional scripts(like in `share_thingscript/main/scripts/bin/`) that can
be supplied a file and output somewhere.(usually: preferably stdout)

See `have.md` for what there is and isnt. (Short list of what already is)
