There are lots of file types.. `.stl`,`dxf` seems the most popular.

Anything that isnt totally bland use of the tool mentioned is put in
`share_thingscript/rootlike/`, `*/` refers to that. A lot of the scripts 
are used for the gallery(`share_thingscript/main/el/gallery`)
`share_thingscript/main/el/sel/gallery/`. (`el/` elements, `sel` sub-elements)


### To Image:
<table>
<tr>
<td><code>.stl</code></td>
<td><b>have</b>; Using <a href="http://povray.org/">povray</a>,
<a href="http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html">stl2pov</a>(<code>*/bin/stl2pov</code>)</td></tr>
<tr><td><code>.amf</code></td><td><i>todo</i>, not sure how</td></tr>
<tr><td><code>.blend</code></td>
       <td><i>todo</i>, <code>blender -b thing.blend -f 0 -o //thing.png</code>, 
           get black-and white in <code>/tmp/</code></td></tr>
<tr><td><code>.scad</code></td>
<td><b>have</b> generates images directly with openscad,
it is the same draawing method as during development; 
doesnt always produce nice images.</td><tr>
<tr><td><code>.scad</code>, <code>.escad</code> via <code>.stl</code></td><td><b>have</b>
Note that possibly often these arent populated with anything pretty. 
It could be suggested to use these to 'show off as assembled'.
(<code>.escad</code> automatically uses <code>extopenscad</code> from
<a href="http://implicitcad.org/">ImplicitCAD</a>.</td></tr>

<tr><td><code>.escad</code></td><td><i>todo</i>, is an   
  <code>extopenscad in.scad -o out.png</code> works? Otherwise go via .stl</td></tr>

<tr><td><code>.dxf</code></td><td><i>todo</i>, imagemagick asks for <a href="http://sk1project.org/">UniConverter</a></td></tr>
<tr><td><code>.pdf,.svg</code> via <code>convert</code> to <code>.png</code></td>
    <td><b>have</b>, using imageMagick, untested.</td></tr>
<tr><td><code>.svg</code></td><td>Maybe browsers may view it directly?</td></tr>
<tr><td><code>.gcode</code></td><td><i>todo</i></td></tr>
<tr><td><code>.jscad</code> of <a href="http://openjscad.org/">openjscad</a>(<a href="https://github.com/joostn/OpenJsCad">gh</a>)</td>
<td><i>todo</i> no reason not to eventually support it</td></tr>
<tr><td><a href="https://github.com/kaosat-dev/CoffeeSCad">CoffeeScad</a></td>
<td>I suppose javascript has its disadvantages, still, seems like overproliferation,
unless its one-on-one with openjscad.
(havent looked how well they're being written, 
if CoffeeSCad can be used with javascript)</td></tr>
<tr><td><code>.skp</code></td><td>None. I think it's proprietary.</td></tr>
<tr><td><code>.step</code></td><td>None.</td></tr>
<tr><td><code>.tx</code></td><td>(dont even know what it is)</td></tr>
<tr><td><code>.ad_prt</code></td><td>(dont even know what it is)</td></tr>
</table>

### To 'live' model display
<table>
<tr><td><code>.stl</code>,<code>.obj</code></td>
<td><b>have</b>; Using <a href="https://github.com/tbuser/thingiview.js">thingiview.js</a> to basically
  see exactly the model.(<code>*/bin/stl2js</code>)</td></tr>
<tr><td><code>.scad,.escad</code></td><td><b>have</b>, using (in the gallery list)
<code>via_openscad your.scad initially_povray</code>, which goes via <code>.stl</code>. 
<code>initially_povray</code> can be replaced with any gallery subelement 
dealing with <code>.stl</code>
like for instance <code>stl2js,just_povray</code></td></tr>

<tr><td><code>.escad</code></td><td>
there is also an <a href="http://www.implicitcad.org/editor">online editor</a></td></tr>
<tr><td><code>.jscad</code></td><td></td></tr>

<tr><td><code>.gcode</code></td><td><i>todo</i>, for instance
<a href="	https://github.com/joewalnes/gcode-viewer">github.com/joewalnes/gcode-viewer</a></td></tr>
<tr><td><code>.dxf</code></td><td>possibly useful to be able to zoom in 
    or something</td></tr>
</table>

### To animation(gif)
<table>
<tr><td><code>.scad, .escad</code></td><td>should be possible with the parameters.</td></tr>
<tr><td><code>.blend</code></td><td></td></tr>
<tr><td><code>.gcode</code></td><td></td></tr>
</table>

### Other
Maybe instructions picture sequence with text.(not sure how)

## Used
* [admesh](http://www.varlog.com/admesh-htm) should be able to convert from `.stl` to
`.stl`, `.vrml`, `.off`, and `.dxf` files
* [stl2pov](http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html%22)
* [povray](http://povray.org/)
* [thingiview](https://github.com/tbuser/thingiview.js)
* [imagemagick](http://imagemagick.org/) converts image sizes, types.
* [openscad](http://www.openscad.org/), 
  [ImplicitCAD](http://implicitcad.org) for converting `.escad`, `.scad` to `.stl`.

## Potential additional
* [**View3dscene**](http://castle-engine.sourceforge.net/view3dscene.php) can load,
  make screen shots and convert a bunch of file types. More aimed at game models, 
  so lower priority.(Note but being able to print `.md3` is nice; convert to `x3d`
  and then use blender to export to `.stl`)
* Other raytracers, [luxrender](http://www.luxrender.net/en_GB/index)?
* `.stl` rendering via blender.
* [assimp](https://github.com/assimp/assimp) to convert a lot.
* [qcad](http://www.qcad.org/en/qcad-documentation/qcad-command-line-tools),
  however i dont see them in my install of qcad..
* others mentioned above.
