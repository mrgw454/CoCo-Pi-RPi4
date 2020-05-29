#!/bin/bash

# script to create a new Coco floppy disk image and and copy all Coco related files to it.
# It will also (optionally) run XRoar and mount the disk image (DriveWire or normal DECB)

# this script can take up to 2 command line parameters:
# Coco driver to use for XRoar (i.e. coco2 coco3, etc.) and use DriveWire (yes or no)

# syntax example:

# ./makeDSK coco2 y

# this will create a new disk image and copy all Coco compatible files to a disk image
# using name of the current folder.  In addition, it will launch MAME using the Coco 2
# driver for XRoar (with HDBDOS) and use DriveWire with this disk image mounted as DRIVE 0.
# If DriveWire is not running, the script will start it.

# Define function for displaying error codes from Toolshed's 'decb' command

functionErrorLevel() {

        if [ $? -eq 0 ]
	then

                echo -e "Successfully copied file to DSK image."
                echo -e

        else

                echo -e "Error during copy process to DSK image."
                echo -e
                # read -p "Press any key to continue... " -n1 -s
		echo -e
		echo -e

        fi

}

# get name of script and place it into a variable
scriptname=`basename "$0"`


# get name of current folder and place it into a variable
floppy=`basename "$PWD"`

# parse command line parameters for standard help options

if [[ $1 =~ --h|--help|-h ]];then

    echo -e
    echo -e "Example syntax:"
    echo -e
    echo -e "./$scriptname <coco driver> <y>|<n>"
    echo -e
    exit 1

fi


# if a previous disk image exists, move into a date-time named folder

if [ -f "$floppy.DSK" ]; then

	foldername=$(date +%Y-%m-%d_%H.%M.%S)

	mkdir "$foldername"

	mv "$floppy.DSK" "$foldername"

	echo -e Archiving existing disk image ["$floppy.DSK"] into backup folder ["$foldername"]
	echo -e
	echo -e
fi

# create new DSK image based on current folder name

echo -e Creating new floppy disk image [$floppy.DSK]
echo -e

decb dskini "$floppy.DSK"


for f in *; do

	# Copy all BASIC files (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .BAS|.bas ]]; then

		echo -e decb copy -0 -a -t -r "$f" "$floppy.DSK","${f^^}"
		decb copy -0 -a -t -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


	# Copy all BINARY files (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .BIN|.bin ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


	# Copy all TEXT files (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .TXT|.txt ]]; then

		echo -e decb copy -3 -a -r "$f" "$floppy.DSK","${f^^}"
		decb copy -3 -a -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


	# Copy all DAT files (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .DAT|.dat ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


	# Copy all ROM files (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .ROM|.rom ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


	# Copy all CHR files for CoCoVGA (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .CHR|.chr ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


# Copy all VG6 files for CoCoVGA (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .VG6|.vg6 ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


# Copy all SCR files for CoCoVGA (and convert names to UPPERCASE) to DSK image
	if [[ $f =~ .SCR|.scr ]]; then

		echo -e decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		decb copy -2 -b -r "$f" "$floppy.DSK","${f^^}"
		functionErrorLevel

	fi


done

echo -e

# list disk image contents

decb dir "$floppy.DSK"
echo -e


# if no parameters, only make disk image and exit

if [ $# -eq 0 ]
  then
    echo -e "Only made disk image as no command line parameters supplied"

	echo -e
	echo -e "Done."
	echo -e

	exit 1

fi



# (optional) load XRoar and mount disk image in Drivewire INSTANCE 0 as DRIVE 0

if [[ $2 =~ Y|y ]];then

	# copy to /media/share1/DW4 so the disk image can be sync'd to other DriveWire servers

	echo "Copying file to [/media/share1/DW4/$floppy/$floppy.DSK] so it can be sync'd to other DriveWire servers..."
	echo -e

	mkdir "/media/share1/DW4/$floppy"
	cp "$floppy.DSK" "/media/share1/DW4/$floppy"

	echo -e


	# make sure HDBDOS is used for DriveWire access


	# Coco 2 section

	if [[ $1 =~ coco2|coco2b|coco2bus ]];then

		# start DriveWire if it's not running

		ps_out=`ps -ef | grep DW4UI | grep -v 'grep' | grep -v $0`
		result=$(echo $ps_out | grep "$1")
		if [[ "$result" != "" ]];then

    		echo -e "DriveWire 4 is running"

		else

    		echo -e "DriveWire 4 is not running.  Starting DriveWire..."
    		echo -e
			$HOME/DriveWire4/DW4.sh > /dev/null 2>&1 &
			sleep 4s

		fi


		# eject disk from DriveWire
		java -jar $HOME/DriveWire4/DW4CLI.jar --instance="0" -command='dw disk eject '"0"
		echo -e

		# insert disk for DriveWire
		java -jar $HOME/DriveWire4/DW4CLI.jar --instance="0" -command='dw disk insert '"0 $PWD/$floppy.DSK"
		echo -e

		# show (confirm) disk mounted in DriveWire
		java -jar $HOME/DriveWire4/DW4CLI.jar --instance="0" -command='dw disk show '"0"
		echo -e

    #cd $HOME/.xroar
    xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -machine-cart hdbdos

		# eject disk from DriveWire
		java -jar $HOME/DriveWire4/DW4CLI.jar --instance="0" -command='dw disk eject '"0"

		echo -e

		# stop DriveWire

		echo -e
		echo -e "Stopping DriveWire..."
		echo -e

		kill $(ps aux | grep 'DW4UI' | awk '{print $2}')

		echo -e
		echo -e "Done."
		echo -e
		exit 1

	fi


	echo -e
	echo -e "Not a valid Coco based driver for DriveWire.  Exiting."
	echo -e
	echo -e "Some valid Coco drivers for XRoar are:"
	echo -e
	echo -e "coco2, coco2b, coco2bus"

	echo -e
	echo -e "Done."
	echo -e
	exit 1

else


	# (optional) load XRoar and mount the disk image as DRIVE 0

	# Coco 2 section

	if [[ $1 =~ coco2|coco2b|coco2bus ]];then

    #cd $HOME/.xroar
    xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -load "$PWD/$floppy.DSK"

		echo -e
		echo -e "Done."
		echo -e

		exit 1

	fi

	echo -e
	echo -e "Not a valid Coco based driver.  Exiting."
	echo -e
	echo -e "Some valid Coco drivers for MAME are:"
	echo -e
	echo -e "coco2, coco2b, coco2bus"

	echo -e
	echo -e "Done."
	echo -e

	exit 1

fi

	echo -e
	echo -e "Done."
	echo -e

	exit 1
