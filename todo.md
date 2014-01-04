NOTE: i'll mark the ones which have an issue, see the latest development commit,
of course, currently still developping on branch master.

## Needed for first release
* Get ThingTracker output to be correct.
  + Appears that just the date is incorrect.
   
#### done for first release
* Static html generations, `thingscript help_browser ..` opens them.
  + Set of static html pages based on current documentation using thingscript itself.
* Thingiview should work again and immediately shows.
* Generate (downloadable)release.
  + Note: just based on globbed patterns,(superset of plain list) not very handy, that. 
* Lists of 'packages' that can be loaded in some order, instead of types.
* Icon to indicate that clicking gets you the 3d model for
  `share/physible/el/sel/gallery/initially_povray` (icon looks a bit out of place though)

## Second release
* Packages for managers. (ArchLinux, Debian) tests-as-if-new-install.(moved it later)

## Other, sorted by type a bit

* `assimp` is completely untested, havent been able to display the `.stl` from the `.dxf`.

* Make more kinds of files representable 
  (see [`have.md`](have.md)) 
  and handle (lack)of dependencies. Suppose best if default figures the best it
  can, given dependencies, and a way to explore the possibilities.

* More/better .css for defaults.(maybe more than one theme, javascript-selectable themes?)

* All bits of data is now stored in files, it would be better to have more of a system.
  `share/rootlike/bin/pack_small_file` can turn  stuff in files into `.json`, 
  `.zip`,`.tar` then `unzip -c file.zip some/file` and `tar -xf file.tar some/file -O`
  can output to stdout.
  
  Not sure how to best get the small files into memory and have the scripts able
  to access it efficiently.

* (maybe)Sometimes you want something, ..but only if.. currently that requires an
  element to be a script. This could be no problem, but some of the elements do need
  to be implemented that way.

* Test/deal with browser-sizes.(mobile)

* Comments for each image.
  Subelements could already implement it, that is right approach?
  (maybe if it can refer to external files for overly long comments)

* Set the files using a simple gui? 
  Maybe `zenity`, sequentially or going back/forth to list of things to potentially set,
  not perfect, but simple..
  Maybe better to use a nodejs thingy?

* A website thingscript directory.

* The main program in `bin/thingscript` written in C or something?
  (What makes it slow/fast? Not sure how to tell things to get things in memory,
   not on the harddisk)

* [Cygwin](http://cygwin.com/) for getting it on windows?(no idea currently)

### Organization, docs, arts
* Some of the stuff in `thingscript_share/main/scripts/` could be better organized..
  It is basically a kind of `on_absence` for files inhabiting the project?

* **Help pages dont cross different thingscript directories at all.**
  Probably put pages on the search for pages across multiple and make a help for
  a whole sequence?

* Add CSS to help pages, and give stuff some class.

* Inline help pages `share_thingscript/helpmaker/el/i`

* Picture of Tester McTest? Download/release symbol, development link symbol.

* `share/physible/resource/overlay_icon/3d.svg` looks a bit heavy on the eyes...
  Also need script using `convert` to convert to the `.png` variants. Also, the
  indicator doesnt get added at the right time?(only when item selected with click)


### Povray
* A few 'floors' in povray(of course in such a way that anyone can add)
  + 1cm grid with 'vague reflection' (best default)
  + Water (silly but pretty?)

* Additionally something else than povray, luxrender? (povray isnt libre)

### Javascript

* Relies on javascript.. I dont like javascripts in the webs myself! If possible
  get the javascript out of the gallery.(not sure if possible without significant 
  change to functionality) As good is to 
  give the user control over the javascript and when it updates. For instance
  with a [userscript](http://userscript.org/) that can detect-and-replace, or
  convince browser developpers to affect the standards as to add a 'JS library'
  system in order to give users more control. Or maybe 
  [noscript surrogates](http://hackademix.net/2011/09/29/script-surrogates-quick-reference/).

* Thingiview data is currently in a `.js` file, but i dont see a way to make those
  proper `.json` files, and still be able to load them.

* Stl-to-javascript php is slow. (And it is php....) Make C version or something.
  (contribute back to origin thingiview project, of course)

### Mission creep

* Maybe -for-instance- gallery objects makes gallery stuff from what is available,
  but have 'wants' which when forfilled make get the page created again.
  'Page as a process', basically, there is data in, and there is a tree of stuff to do.
