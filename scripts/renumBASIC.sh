#!/bin/bash

# script to renumber a BASIC program

# more information about this utility can be found here:
# https://github.com/tilleul/basic_renumber

# 3 parameters are required
# original filename, new filename, renumber increcment value

nodejs $HOME/source/basic_renumber/renumber.js $1 $2 $3


