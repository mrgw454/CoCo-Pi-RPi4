#!/bin/bash

# script to extact all files from a Coco floppy disk image

# syntax example:

# ./extractDSK <DSK image>

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


# use MAME's imgtool to extract all files from DSK image

imgtool getall coco_jvc_rsdos "$1"


# use Toolshed's decb command to translate any BASIC files from tokenized to ASCII

# set up a temp folder for extract

mkdir "extract"


for f in *; do


        # Copy all BASIC files (and convert names to UPPERCASE) from DSK image
	# You may need to add the '-t' option (to perform BASIC token translation) to the 'decb' command
        if [[ $f =~ .BAS|.bas ]]; then

                echo -e decb copy -0 -b -r "$f" "extract/${f^^}"
                decb copy -0 -b -t -r "$f" "extract/${f^^}"
                functionErrorLevel
		rm "$f"

        fi


        # Copy all BINARY files (and convert names to UPPERCASE) from DSK image
        if [[ $f =~ .BIN|.bin ]]; then

                echo -e decb copy -2 -b -r "$f" "extract/${f^^}"
                decb copy -2 -b -r "$f" "extract/${f^^}"
                functionErrorLevel
		rm "$f"

        fi


        # Copy all TEXT files (and convert names to UPPERCASE) from DSK image
        if [[ $f =~ .TXT|.txt ]]; then

                echo -e decb copy -3 -a -r "$f" "extract/${f^^}"
                decb copy -3 -a -r "$f" "extract/${f^^}"
                functionErrorLevel
		rm "$f"

        fi


        # Copy all DAT files (and convert names to UPPERCASE) from DSK image
        if [[ $f =~ .DAT|.dat ]]; then

                echo -e decb copy -1 -a -r "$f" "extract/${f^^}"
                decb copy -1 -a -r "$f" "extract/${f^^}"
                functionErrorLevel
		rm "$f"

        fi


        # Copy all ROM files (and convert names to UPPERCASE) from DSK image
        if [[ $f =~ .ROM|.rom ]]; then

                echo -e decb copy -2 -b -r "$f" "extract/${f^^}"
                decb copy -2 -b -r "$f" "extract/${f^^}"
                functionErrorLevel
		rm "$f"

        fi


done

# move any translated BASIC files back into original folder

mv extract/* ./


# remove temp folder

rmdir "extract"

exit 1

echo -e
echo "Done."
echo -e
