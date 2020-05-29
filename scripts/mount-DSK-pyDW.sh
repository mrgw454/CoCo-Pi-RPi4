#!/bin/bash

# script to mount a DSK image on all defined pyDW hosts (local and/or remote)

# this script requires 2 command line parameters (DSK image file and pyDW DRIVE #)

# syntax example:

# ./mount-DSK-pyDW </path/to/DSK/image/file> <0/1/2/3>


# get name of script and place it into a variable
scriptname=`basename "$0"`

# parse command line parameters for standard help options

if [[ $1 =~ --h|--help|-h ]];then

    echo -e
    echo -e "Example syntax:"
    echo -e
    echo -e "./$scriptname </path/to/DSK/image/file> <0/1/2/3>"
    echo -e
    exit 1

fi

if [ ! -f "$1" ]; then
    echo "File not found!  You must include a fully qualified path and DSK filename."
    echo -e
    echo "./$scriptname --help for syntax."
    echo -e
    exit 1
fi

if [ ! -f "$HOME/scripts/mount-DSK-pyDW.txt" ]; then
    echo "pyDW host file not found!  Please add at least one host in the following file:"
    echo -e
    echo "mount-DSK-pyDW.txt"
    echo -e
    exit 1
fi


cd $HOME/pyDriveWire


# read file with pyDW hosts and process each one
serverlist=$HOME/scripts/mount-DSK-pyDW.txt
while IFS= read -r pyDWhost
do

	# set HDBDOS translation to false for all pyDW hosts
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw server hdbdos 0


	# eject DSK in selected DRIVE for selected instance
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 0
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk eject $2

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 1
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk eject $2

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 2
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk eject $2

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 3
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk eject $2

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 0


	# insert DSK in selected DRIVE for selected instance
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 0
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk insert $2 "$1"

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 1
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk insert $2 "$1"

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 2
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk insert $2 "$1"

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 3
	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw disk insert $2 "$1"

	$HOME/pyDriveWire/pyDwCli http://$pyDWhost:6800 dw instance select 0


done < "$serverlist"

echo -e
echo "Done."
echo -e

