#!/bin/bash

# script to extact all files from a Coco floppy disk image

# syntax example:

# ./extractDSK.sh <DSK image>

# Define function for displaying error codes from Toolshed's 'decb' command

functionErrorLevel() {

        if [ $? -eq 0 ]
        then

                echo -e "Successfully extracted DSK image."
                echo -e

        else

                echo -e "Error during extract process from DSK image."
                echo -e
                read -p "Press any key to continue... " -n1 -s
                echo -e
                echo -e

        fi

}


# get name of script and place it into a variable
scriptname=`basename "$0"`


# get name of current folder and place it into a variable
floppy=`basename "$PWD"`
echo current folder $floppy

# use Toolshed's decb command to extract all files from DSK image

decb dsave -e -l "$1", ./
functionErrorLevel


# perform BAS detokenization and/or end of line translation as necessary
$HOME/scripts/check-BAS-files.sh


exit 1

echo -e
echo "Done."
echo -e

