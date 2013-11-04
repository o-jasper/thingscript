There are lots of file types.. Some more are `.skp`, `.blend`, `.amf`, `.step`. 
`.dxf`, `.pdf`, `.svg`, `.tx`, `ad_prt` (dont even know what some of those are)
And circuit boards are physibles too! We wont be requiring all the dependencies,
what you have should work and the rest fails gracefully?

<table>
<tr><td><u>To image</u></td></tr>
<tr>
<td><code>.stl</code></td>
<td>Using <a href="http://povray.org/">povray</a>,
<a href="http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html">stl2pov</a></td></tr>
<tr><td><code>.amf</code></td><td>None</td></tr>
<tr><td><code>.blend</code></td><td>None</td></tr>

<tr><td><code>.skp</code></td><td>None. I think it's proprietary.</td></tr>
<tr><td><code>.step</code></td><td>None.</td></tr>

<tr><td><code>.dxf</code></td><td>None, imagemagick asks for <a href="http://sk1project.org/">UniConverter</a></td></tr>
<tr><td><code>.pdf</code></td><td>None, use ImageMagick?</td></tr>
<tr><td><code>.svg</code></td><td>None, use ImageMagick? 
Maybe browsers may view it directly?</td></tr>
<tr><td><code>.tx</code></td><td>(dont even know what it is)</td></tr>
<tr><td><code>.ad_prt</code></td><td>(dont even know what it is)</td></tr>

<tr><td><u>To <code>.js</code></u></td></tr>
<tr>
<td><code>.stl</code>,<code>.obj</code></td>
<td>Using <a href="https://github.com/tbuser/thingiview.js">thingiview.js</a> to basically
  see exactly the model.</td></tr>
</table>

Just a few however, lots of projects out there just have `.stl`, and 
images can be added manually. (Still, more is better)

### Problems
One problem that many programs out there dont do computer-readable output. 
Well for instance `admesh` you can, and it does read that data from stdout.
However it requires some work and no guarantee that output will stay the same, a next
version might easily break it.(For no good reason at all)

This is a *persistant* problem. Firefox is a widely used program, 11 years old
now, older if you count predecessors. Go fucking try getting which tabs are open.
No. There is none. Whereas programs like `mpd` clearly show this sort of data 
transfer is perfectly doable!

Probably not because their priorities lie completely different and windows works
differently. But still, i think for a project like `firefox` this is a relatively
easy thing to do.

## Used
[admesh](http://www.varlog.com/admesh-htm) should be able to convert from `.stl` to
`.stl`, `.vrml`, `.off`, and `.dxf` files

## Potential additional
[**View3dscene**](http://castle-engine.sourceforge.net/view3dscene.php) can load,
make screen shots and convert a bunch of file types. More aimed at game models, 
so lower priority.(Note but being able to print `.md3` is nice; convert to `x3d`
and then use blender to export to `.stl`)
