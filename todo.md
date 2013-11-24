
## Needed for first release

* Thingiview and gallery items should display correctly quickly.
* Instructions on how to use.
* Get ThingTracker output to be correct.(also instruct)
  + thumbnail url needs complete adress
  + check it..
* Packages for managers. (ArchLinux, Debian)
* It isnt clear what clicking on the main image does.
  (depending on configuration that is what triggers thingiview)

#### done 
* Static html generations
  + `thingscript help_browser ..` opens them.
  + `## Related` gets linked added to it.
    (NOTE obsoleted when thingscript does thingscript)
* Set of static html pages based on current documentation using thingscript itself.

## Other

* Relies on javascript.. I dont like javascripts in the webs myself! If possible
  get the javascript out of the gallery.(not sure if possible without significant 
  change to functionality) As good is to 
  give the user control over the javascript and when it updates. For instance
  with a [userscript](http://userscript.org/) that can detect-and-replace, or
  convince browser developpers to affect the standards as to add a 'JS library'
  system in order to give users more control. Or maybe 
  [noscript surrogates](http://hackademix.net/2011/09/29/script-surrogates-quick-reference/).

* thingiview javascript data in json files.

* More/better .css for defaults.(maybe more than one theme)

* Make more kinds of files representable (see `have.md`) and handle
  (lack)of dependencies.

* Stl-javascript php is slow. (And it is php....) Make C version or something.

* Some of the stuff in `thingscript_share/main/scripts/` could be better organized..
  It is basically a kind of `on_absence` for files inhabiting the project?

* Try lay out principles better.

* A few 'floors' in povray(of course in such a way that anyone can add)
  + 1cm grid with 'vague reflection' (best default)
  + Water (silly but pretty?)

* Additionally omething else than povray, luxrender? (povray isnt libre)

* Defaults use whatever dependencies present.(currently assume stuff exists)

* Put a lot of the data in files now in a json file and make a 
  html+javascript page that generates that json. Part of the issue is that
  `thingscript get ..` gets a file location.(distinguish between items that do/dont
      warrant a file?) Not sure...

* `| while read line; do ...` doesnt do anything with the last line. 
  (TODO this refers to the last line when `thingscript handle ..`?)
