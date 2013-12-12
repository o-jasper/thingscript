#!/bin/bash
# Installs some things needed for some aspects of thingscript.
#Note: decided not to use Makefile in this case.

ROOTLIKE=/home/$USER/.thingscript_share/rootlike/

run()
{   case "$1" in
       node_modules)
           if [ -e $ROOTLIKE/share/node_modules ]; then
               exit
           fi
           cd $ROOTLIKE/share/
           npm install schema schema-validator ;; # Needed for validators.
       all)
          for el in node_modules; do
              run $el
          done ;;
    esac
}

run $@
