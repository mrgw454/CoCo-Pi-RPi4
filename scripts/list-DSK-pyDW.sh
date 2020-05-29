#!/bin/bash

# script to list any DSK images on all defined pyDW hosts (local and/or remote)

# this script requires 2 command line parameters (DSK image file and pyDW DRIVE #)

# syntax example:

# ./list-DSK-pyDW.sh


# get name of script and place it into a variable
scriptname=`basename "$0"`

# parse command line parameters for standard help options

if [[ $1 =~ --h|--help|-h ]];then

    echo -e
    echo -e "Example syntax:"
    echo -e
    echo -e "./$scriptname"
    echo -e
    exit 1

fi


if [ ! -f "$HOME/.mame/mount-DSK-pyDW.txt" ]; then
    echo "pyDW host file not found!  Please add at least one host in the following file:"
    echo -e
    echo "mount-DSK-pyDW.txt"
    echo -e
    exit 1
fi


cd $HOME/pyDriveWire


# read file with pyDW hosts and process each one
serverlist=$HOME/.mame/mount-DSK-pyDW.txt
while IFS= read -r pyDWhost
do

	# set HDBDOS translation to false for all pyDW hosts
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw server hdbdos 0


	# show DSK image(s) mounted for instance

	echo "Host: $pyDWhost  instance 0"
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk show 0

	echo "Host: $pyDWhost  instance 1"
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk show 1

	echo "Host: $pyDWhost  instance 2"
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk show 2

	echo "Host: $pyDWhost  instance 3"
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk show 3

	echo -e
	echo -e


done < "$serverlist"

echo -e
echo "Done."
echo -e

