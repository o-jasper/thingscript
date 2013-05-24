
There are lots of file types.. Some more are `.skp`, `.blend`, `.amf`, `.step`. 
`.dxf`, `.pdf`, `.svg`, `.tx`, `ad_prt` (dont even know what some of those are)
And circuit boards are physibles too! We wont be requiring all the dependencies,
what you have should work and the rest fails gracefully?

From these files to image:(no entry => none)
<table>
<tr>
<td><code>.stl</code></td>
<td>Using <a href="http://povray.org/">povray</a>,
<a href="http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html">stl2pov</a></td></tr>
</table>

From these to `.js`
<table>
<tr>
<td><code>.stl</code>,<code>.obj</code></td>
<td>Using <a href="https://github.com/tbuser/thingiview.js">thingiview.js</a></td></tr>
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
