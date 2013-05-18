
# How to run it

    cd project_dir/
    #Put files described below there.
    cd pages_parent_dir/
    thingscript $OLDPWD

# Data it looks for
Basically you put data at the project directory, and it looks for it and makes a
page from it. 

It also looks for information on how to make the page, firstly under `layout/` of 
the project directory, secondly `layout/` of the parent directory of the pages 
representing it. (For consistency the latter is advised) Stuff that is really needed
but doesnt exist after that is copied from, `~/.thingscript/layout/` and 
`/etc/thingscript/layout/`, whichever is found to exist first.

`layout/`, (possibly in `layout.tar`,`layout.tar.gz`) must contain:
* `layout.html`(which has to look for a .css itself)
* `author.md`.

May also contain(all pics are either `.jpg`,`.png`,`.svg`,`.gif`.
* `pics/logo`, `pics/author`
* `widgets/pics/download`
* `widgets/download`
* `pre.html`, `pre.md`, `post.html`, `post.md`.
* `licenses/` if it finds a `license` file, it appends `.html`.

### Things it looks for in the project.
The stuff in the `layout/` directory as explained above, of course.

`page/`(possibly in `page.tar`,`page.tar.gz`) contains stuff specific to the
project. The `.md` files use markdown.

* `title` just a plain text file containing the title.
* `version` which version it is. If not provided, it may try fiddling it from
  version control systems.(like git)
* `link` project link.
* `short_description.md`, `description.md`, `license.md`/`license`, 
  `usage.md`, `caveits.md`
  various markdown texts.
* `BOM.md`, `BOM` bill of materials.
* `params/` files with parameters, the names of the files may be conventions.
* `predecessors`, `successors`. #TODO these lists..
* `depreciated.md` depreciated, and reasons why. `use_instead` can suggest..
* `tags` newline separated sufficiently relevant words.
* `gallery_list` contains the list of pictures and designs that are to be in the
  gallery, they're shown in that order. If it doesnt exist first 
  `ls pics/*.png pics/*.jpg pics/*.gif output/*.stl` is used.
* `src_list` list of source files; these are the prefered files for editing.
   (and it isnt open source if you dont provide them somewhere)
   defaultly everything in `src/`, in this one if a directory is given, it is
   taken to mean v. TODO
* `direct_download` file with immediate download.
* `file_list` design file lists, defaults `ls output/*`
* `project_image` small representative image, defaultly created from gallery list.
+ `gpg` GPG signature of all the files(re-sign for any changes of course!)
  Excepting itself, the sha checksum, torrents, thing trackers.
+ `sha512sum` sha sum of all files excepting itself, the GPG, the sha checksum, 
  torrents, thing trackers.
+ `torrent/` torrent files to get this.
* `thing_trackers` thing trackers to use.(recommended if you want to spread it around) 
* If `thing_track.json` exists, it will override generating one from the data 
  here.(it seems silly to override it though!)

Just a few are mandatory; `title`, either `short_description.md` or `description.md`, 
`license.md` or `license`.

As the default for the gallery list suggests, it is suggested to put the output
of sources in `output/` and pictures in `pics/`

# TODO title section
[thingiview.js](https://github.com/tbuser/thingiview.js) is used to draw the models.
(I use the 'convert to javascript array first' approach.)

Figuring out [how to draw .stl files](http://www.evilmadscientist.com/2007/slicing-stl-files-in-pov-ray/) in [povray](http://povray.org/) was nice. For some reason browsers dont have
scripting with screenshotting as you like.
(this makes much nicer renders than that though!)
