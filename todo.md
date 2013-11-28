NOTE: i'll mark the ones which have an issue, see the latest development commit,
of course, currently still developping on branch master.

## Needed for first release
* Instructions on how to use.
* Get ThingTracker output to be correct.(also instruct)
  + check it..
* Packages for managers. (ArchLinux, Debian) (tests)
* It isnt clear what clicking on the main image does. What it does depends on
  `share_thingscript/main/el/sel/gallery/initially_povray` needs a symbol to 
   indicate.(Probably best to add that in javascript)

#### done for first release
* Static html generations, `thingscript help_browser ..` opens them.
* Set of static html pages based on current documentation using thingscript itself.
* Thingiview should work again and immediately shows.
* Generate (downloadable)release.
  + Note: just based on globbed patterns,(superset of plain list) not very handy, that. 

## Other, sorted by type a bit

* Make more kinds of files representable (see `have.md`) and handle
  (lack)of dependencies.

* More/better .css for defaults.(maybe more than one theme)

* Defaults use whatever dependencies present.(currently assume stuff exists)

* Put a lot of the data in files now in a json file and make a 
  html+javascript page that generates that json. Part of the issue is that
  `thingscript get ..` gets a file location.(distinguish between items that do/dont
      warrant a file?) Not sure...

* `cat: : No such file or directory` appears, NOTE: hmm this in part how it works..
  Just need to suppress the error, or test for the file instead of what is done now.

* (maybe)Sometimes you want something, ..but only if.. currently that requires an
  element to be a script. This could be no problem, but some of the elements do need
  to be implemented that way.

* Test/deal with browser-sizes.(mobile)

* Set the files using a simple gui? 
  Maybe `zenity`, sequentially or going back/forth to list of things to potentially set,
  not perfect, but simple..

### Organization, docs, arts
* Some of the stuff in `thingscript_share/main/scripts/` could be better organized..
  It is basically a kind of `on_absence` for files inhabiting the project?

* Try lay out principles better.(probably work into help pages)

* Inline help pages `share_thingscript/helpmaker/el/i`

* Use issues instead of this file?

* Picture of Tester McTest? Download/release symbol, development link symbol.

### Povray
* A few 'floors' in povray(of course in such a way that anyone can add)
  + 1cm grid with 'vague reflection' (best default)
  + Water (silly but pretty?)

* Additionally omething else than povray, luxrender? (povray isnt libre)

### Javascript

* Relies on javascript.. I dont like javascripts in the webs myself! If possible
  get the javascript out of the gallery.(not sure if possible without significant 
  change to functionality) As good is to 
  give the user control over the javascript and when it updates. For instance
  with a [userscript](http://userscript.org/) that can detect-and-replace, or
  convince browser developpers to affect the standards as to add a 'JS library'
  system in order to give users more control. Or maybe 
  [noscript surrogates](http://hackademix.net/2011/09/29/script-surrogates-quick-reference/).

* thingiview javascript data in json files.

* Stl-to-javascript php is slow. (And it is php....) Make C version or something.
