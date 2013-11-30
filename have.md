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
<tr><td><code>.amf</code></td><td>Todo, not sure how</td></tr>
<tr><td><code>.blend</code></td>
       <td>Todo, <code>blender -b thing.blend -f 0 -o //thing.png</code>, 
           get black-and white in <code>/tmp/</code></td></tr>
<tr><td><code>.scad</code></td><td>Todo, <code>openscad in.scad -o out.png</code>
would work, but doesnt always produce nice images. Go via <code>.stl</code>
Note that possibly often these arent populated with anything pretty. 
It could be suggested to use these to 'show off as assembled'.<br><br></td></tr>
<tr><td><code>.escad</code></td><td>Todo, is an
    <a href="http://implicitcad.org/">ImplicitCAD</a> file
    <code>extopenscad in.scad -o out.png</code> works? Otherwise go via .stl</td></tr>

<tr><td><code>.skp</code></td><td>None. I think it's proprietary.</td></tr>
<tr><td><code>.step</code></td><td>None.</td></tr>

<tr><td><code>.dxf</code></td><td>None, imagemagick asks for <a href="http://sk1project.org/">UniConverter</a></td></tr>
<tr><td><code>.pdf</code></td><td>None, use ImageMagick?(seems to work okey)</td></tr>
<tr><td><code>.svg</code></td><td>None, use ImageMagick? 
Maybe browsers may view it directly?</td></tr>
<tr><td><code>.tx</code></td><td>(dont even know what it is)</td></tr>
<tr><td><code>.ad_prt</code></td><td>(dont even know what it is)</td></tr>
<tr><td><code>.gcode</code></td><td>Todo, gcode</td></tr>
</table>

### To 'live' model display
<table>
<tr><td><code>.stl</code>,<code>.obj</code></td>
<td><b>have</b>; Using <a href="https://github.com/tbuser/thingiview.js">thingiview.js</a> to basically
  see exactly the model.(<code>*/bin/stl2js</code>)</td></tr>
<tr><td><code>.scad,.escad</code></td><td>Todo, could be done via <code>.stl</code>,
there is also an <a href="http://www.implicitcad.org/editor">online editor</a></td></tr>
<tr><td><code>.gcode</code></td><td>Todo, javascript gcode viewers exist</td></tr>
<tr><td><code>.dxf</code></td><td>No, possibly useful to be able to zoom in 
    or something</td></tr>
</table>

### To animation(gif)
<table>
<tr><td><code>.scad, .escad</code></td><td>No,Should be possible.</td></tr>
<tr><td><code>.blend</code></td><td>No</td></tr>
</table>

### Other
Maybe instructions picture sequence with text.(not sure how)

## Used
* [admesh](http://www.varlog.com/admesh-htm) should be able to convert from `.stl` to
`.stl`, `.vrml`, `.off`, and `.dxf` files
* [stl2pov](http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html%22)
* [povray](http://povray.org/)
* [thingiview](https://github.com/tbuser/thingiview.js)

## Potential additional
* [**View3dscene**](http://castle-engine.sourceforge.net/view3dscene.php) can load,
  make screen shots and convert a bunch of file types. More aimed at game models, 
  so lower priority.(Note but being able to print `.md3` is nice; convert to `x3d`
  and then use blender to export to `.stl`)
* Other raytracers, [luxrender](http://www.luxrender.net/en_GB/index)?
* `.stl` rendering via blender.
