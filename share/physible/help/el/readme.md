# Element files directory

`thingscript handle $FILE` will output the file to standard output excepting stuff
between dollar signs(`$dollar$`), which are taken as commands.

The binaries/scripts are 'elements' and are in `el/`. The commands may also
have arguments. <code>$dollar$some_element arg1 arg2$dollar$</code>

In order for the binary/scripts to work, they have to be permitted to execute.
(`chmod +x ..those files..`)

There are 'special elements' which are not taken to be a script/program. 
Those files are also obtained from the `el/` directory:
* `_` are taken to point at an file in which elements must again be replaced.
* `.cat` are taken to aim at files that should be outputted verbatim.
