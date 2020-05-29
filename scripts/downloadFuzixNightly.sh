#!/bin/bash

clear

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

echo -e
echo -e "This script will download the latest Fuzix nightly build."
echo -e
echo -e "The existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading latest file..."
echo -e
wget -P /media/share1/DW4/GORDON/FUZIX http://fuzix.play-classics.online/fuzix-latest.zip

cd /media/share1/DW4/GORDON/FUZIX

    echo -e
    unzip -o /media/share1/DW4/GORDON/FUZIX/fuzix-latest.zip
    echo -e
    echo -e "Done!"
    echo -e
    read -p "Press any key to continue." -n1 -s

rm /media/share1/DW4/GORDON/FUZIX/fuzix-latest.zip

cd $HOME/.mame


