Elements can be written into files ending with `_` files by surrounding them with`$`;
`$some_element arg1 arg2$` using `thingscript handle file` uses the elements.

When `thingscript handle $FILE` is encountered, it runs the file in the respective
element script in `thingscript get elements/$the_element`, and puts the output in
place of the element.

It uses the operating system to run it, this way the scripts can be written with
basically anything. You have to `chmod +x` the files for it to work.

There are 'special elements' which are not taken to be a the script. Those files
are also obtained from the `elements/` directory:
* `_` are taken to point at an file in which elements must again be replaced.
* `.cat` are taken to aim at files that should be outputted verbatim.
