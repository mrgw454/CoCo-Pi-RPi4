#!/bin/bash

cd $HOME/.xroar

XROARPARMSFILE=`cat $HOME/.xroar/.optional_xroar_parameters.txt`
export XROARPARMS=$XROARPARMSFILE

clear

if [ -e $HOME/.xroar/.xroar_cassette ]
then
    cassette=`cat $HOME/.xroar/.xroar_cassette`

    if [ -e "$cassette" ]
    then

   	echo "CASSETTE save file found - automounting [$cassette]"
    	echo
    	read -p  "Press any key to continue." -n1 -s
    	echo
	xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -cart gmc -no-cart-autorun -run "$cassette" $XROARPARMS

    else

   	echo "CASSETTE image [$cassette] not found in CASSETTE save file.  Aborting."
	echo
	echo "Please run \"Clear all saved mount files\" on Utilities Menu."
    	echo
    	read -p  "Press any key to continue." -n1 -s
    	echo

    fi

else

    xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -cart gmc -no-cart-autorun $XROARPARMS

fi

# capture XRoar ERRORLEVEL

if [ $? -eq 0 ]
then
        echo

else
        echo
        echo "Please make note of message above when requesting help."
        echo
        read -p  "Press any key to continue." -n1 -s
fi

cd $HOME/.mame
CoCoPi-menu-Coco2-XRoar.sh
