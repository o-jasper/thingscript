
[admesh](http://www.varlog.com/admesh-htm) should be able to convert from `.stl` to
`.stl`, `.vrml`, `.off`, and `.dxf` files

There are lots of file types.. Some more are `.skp`, `.blend`, `.amf`. 
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
<td>Using <a href="http://povray.org/">povray</a>,
<a href="http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html">stl2pov</a></td></tr>
</table>

However, lots of projects out there just have `.stl`, and 
images can be added manually. (Still, more is better)
