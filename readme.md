
# Script for making a website with physibles
For linux(perhaps macosx/unix too) currently. 

## Features
* Viewers can easily be added to the gallery.
  `.stl` and `.obj` viewing using
  [thingiview.js](https://github.com/tbuser/thingiview.js).(the precalculated approach)
  `.stl` model preview using [povray](http://povray.org/), [stl2pov](http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html"), and [admesh](http://www.varlog.com/admesh-htm) 
  a bit to figure out the location.(some of those may take long, it checks the timestamps)

* Configurable, but with good defaults. Sequence of overriding preferences means 
  that you can change behavior, or provide behavior as defaults.

  A sufficiently high power user is indistinguishable from a developper, *no* 
  language is special in extending this, everything is executed as if it is a
  program.(other than it being an extra dependency of course)

* Good documentation, build into the system itself but also in the form of static
  html. (`thingscript help`,`thingscript help_browser`) Users can document their
  own stuff too, just plunk the file in at the correct location.

### Install
Get it with `git clone https://github.com/o-jasper/thingscript`.

Dependencies: thingiview.js is source included. If povray and admesh arent
installed, it should just fail to do the things pertaining to it. Currently it 
is basically linux (/unix-like?) only.

I dont have a proper install methods that actually puts stuff in
`/usr/share/thingscript/` and `/bin/thingscript/`,(yet) so you have to do:

    cd ~
    ln -s $thingiview_dir/share_thingscript .thingscript
    PATH=$PATH:$thingiview_dir/bin #Add this to ~/.bashrc for permanence.

The latter i prefer to add `PATH=$PATH:~/.bin/` to `~/.bashrc` and symlink that
to the 'binary' instead.

### Usage
    
    thingscript page $project_directory/

It will ask for some files to exist, the intention is that they go in 
`$project_directory/thingscript/`. Some things are really data of a project,
and perhaps in the future having them elsewhere will trigger an error.

For the asked file you can use `thingscript help $the_file` or
`thingscript help_browser $the_file` to get information about what it expects
in that file.

I suggest you try it on `testpage/`. You can also look at it as an example.

### Useful bits
Maybe some bits are useful as script in another context. Most of them will be in
`share_thingscript/main/scripts/bin/`. I try to develop them in the direction
of them being more stand-alone.(but they use `thingscript get` currently)

## Author, license
Jasper den Ouden, under the GPL currently

Help is appreciated, probably the easiest way
(requiring the least knowledge of the project itself) to help is to make
additional scripts(like in `share_thingscript/main/scripts/bin/`) that can
be supplied a file and output somewhere.(usually: preferably stdout)

See `have.md` for what there is and isnt. (Short list of what already is)
