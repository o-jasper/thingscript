#!/bin/bash
INFO=$(want $1-stl_info) #Get information file.
cat $INFO | stl2pov $1 > $2
