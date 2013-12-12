
# Script that generates a page for 
For linux(perhaps macosx/unix too) currently. 

## Features
* Very general. Much more general than just this case.
* Creates files to be used by [thingtracker](http://thingtracker.net/).(not well tested yet)
* [thingiview.js](https://github.com/tbuser/thingiview.js)`.stl` and `.obj` viewing,
  `.stl` model preview using [povray](http://povray.org/), 
  a bit to figure out the location. Checks the timestamps to see what is needed.

* Configurable, but with good defaults. Sequence of overriding preferences means 
  that you can change behavior, or provide behavior as defaults.

  A sufficiently high power user is indistinguishable from a developper, *no* 
  language is special in extending this, everything is executed as if it is a
  program.(other than it being an extra dependency of course)

* Good documentation, build into the system itself but also in the converted to
  of (static)html, which can be generated using the thingscript itself. 
  (`thingscript help`,`thingscript help_browser`) Users can document their
  own stuff too, just plunk the file in at the correct location.

* If you expose the input of the program to the internet, its incredibly insecure.

### Install
Get it with `git clone https://github.com/o-jasper/thingscript`.

Dependencies, basically, bash and markdown. With lack of other dependencies,
like `povray` or `admesh`, it will just fail at those tasks.

The following should produce a user level install:

    cd $where_you_put_it/thingscript/; sh install.sh userlevel_install` should install
    PATH=$PATH:~/.bin/ #Add that to bashrc if you havent already.

### Usage examples
Use `thingscript help_browser` or start from `share/main/tso/html/index.html`
and browse directly.

#### Make representation page

    thingscript mk page project
#### Makes a release

    thingscript mk release project/
#### Makes a thingtracker json file

    thingscript mk tracker testfile/

#### Combines thingtrackers from the single-item ones.

    thingscript mk tracker_list tracker_list_name.json : project_dir_1 project_dir_2/
    
#### Use help

    thingscript help mk/tracker_list
    thingscript help_browser el/author #Opens a browser.
    
If the static html is build, you can view it directly 
`share/physible/tso/html/index.html`.

#### Demonstrates getti

    cd testpage/; thingscript get author; thingscript cat_get author;
    cat $(thingscript get author) #Demonstrate get, cat_get



### Useful bits
Maybe some bits are useful as script in another context. Most of them will be in
`share_thingscript/main/scripts/bin/`. I try to develop them in the direction
of them being more stand-alone.(but they use `thingscript get` currently)

Conversely, bits of commandline pertaining to 3dp files can be useful for this
project.

### Todo list
There is a todo list in
[`todo.md`](https://github.com/o-jasper/thingscript/blob/master/todo.md), feel free to create issues if you have something to say on them.

## Author, license
Jasper den Ouden, under the GPLv3 currently

Help is appreciated, probably the easiest way
(requiring the least knowledge of the project itself) to help is to make
additional scripts(like in `share_thingscript/main/scripts/bin/`) that can
be supplied a file and output somewhere.(usually: preferably stdout)

See [`have.md`](https://github.com/o-jasper/thingscript/blob/master/have.md)
for what there is and isnt. (Short list of what already is)

### Credits
[thingiview.js](https://github.com/tbuser/thingiview.js)(source included) draws `.stl` files.
(the precalculated approach)

[stl2pov](http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html") converts `.stl` so
[povray](http://povray.org/) can raytrace images from them.

[openscad](http://www.openscad.org/),
[ImplicitCAD](http://implicitcad.org) for converting `.escad`, `.scad` to `.stl`.
(and subsequently thingiview etc. openscad can also go straight to images.)

[admesh](http://www.varlog.com/admesh-htm) for getting data out of `.stl` files.

Optionally validates the schema with 
<code>npm install <a href="https://github.com/akidee/schema.js">schema</a> 
<a href="https://github.com/Nijikokun/Validator.git">schema-validator</a></code>, and
as plain json with [yajl](http://lloyd.github.com/yajl/).

[imagemagick](http://imagemagick.org/) converts image sizes, types.

[Markdown](http://daringfireball.net/projects/markdown/)(its what reddit uses)
Multiple implementations exist, i use
[discount](http://www.pell.portland.or.us/~orc/Code/discount/).

All the stuff in the background.
