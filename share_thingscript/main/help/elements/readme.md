Elements can be written into files ending with `_` files by surrounding them with`$`;
`$some_element arg1 arg2$`

When `thingscript handle $FILE` is encountered, it runs the code in the respective
element script in `thingscript get elements/$the_element`, and puts the output in
place of the element.

There are 'special elements' ending with:

* `_` are taken to point at an file in which elements must again be replaced.
* `.cat` are taken to aim at files that should be outputted verbatim.
