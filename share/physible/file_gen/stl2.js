#!/bin/bash

runit()
{   echo 'designs["'$2'"]='
    stl2js $1 #Refers to another script in share_thingscript/rootlike/bin/
    echo ';'
}
runit $1 $2 > $2
