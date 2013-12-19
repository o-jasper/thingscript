
# Script that generates pages/data inserting bits based on commands
Originally it was intended just for representing physical designs, but it can
really replace more generally.

For linux(perhaps macosx/unix too) currently.

## Features
* For representing physical designs, can represent files, for instance `.stl` 
  using [thingiview.js](https://github.com/tbuser/thingiview.js) or
  [povray](http://povray.org/), or use it indirectly, (`.scad`).
  Creates files to be used by [thingtracker](http://thingtracker.net/).
  (latter untested) [`have.md`](have.md) contains a list of files that are/could
  be represented.

* Configurable, but with good defaults. Sequence of overriding preferences means 
  that you can change behavior, or provide behavior as defaults.

  A sufficiently high power user is indistinguishable from a developper, *no* 
  programming language is special in extending this, everything is executed as
  if it is a program.(other than it being an extra dependency of course)

* Documentation build into the system itself but also in the converted to
  of (static)html, which can be generated using the thingscript itself. 
  (`thingscript help`,`thingscript help_browser`) Users can document their
  own stuff too, just plunk the file in at the correct location.

* If you expose the input of the program to the internet, its incredibly insecure.
  (Files handled as with having thingscript elements )

### Install
Get it with `git clone https://github.com/o-jasper/thingscript`.

Dependencies, bash, markdown. All other lacking dependencies will just make it
fail tasks that use the programs. ()

The following should produce a user level install:

    cd $where_you_put_it/thingscript/; sh install.sh userlevel_install` should install
    PATH=$PATH:~/.bin/ #Add that to bashrc if you havent already.

### Usage examples
For anything using a project directory, there are files in the `thingscript/` 
directory in the project that indicate how to deal with it.

#### Make representation page
To make a representation page, you first make some files to provide the info regarding 
the object. (There are more optional ones)

    mkdir $PROJECT/thingscript; cd $PROJECT/thingscript;
    echo 'my title' > title
    echo 'your name/alias' > author
    echo 'in category' > category
    echo 'Describe your project'  > short_description
    echo 'What license you put the project under'  > license
    cd -;
    thingscript mk page $PROJECT

Making the files yourself will be fine for many people, but raise brows for many
more, but overall in the future it should provide a way to fill the entries from
a (web)gui.

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
