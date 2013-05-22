#!/bin/bash
#Delete stuff so the check if it is actually newer doesnt hide bugs.

rm testpage/page.html
cd testpage/output/
rm *.js *.png *.pov
