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

echo -e
echo -e "This script will download all of the ROM files necessary for use with CoCoPi."
echo -e
echo -e "Please make a backup of all your ROM files in /media/share1/roms"
echo -e "as any existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading ROM files..."
echo -e
wget -P /media/share1/roms http://rickadams.org/ronklein/CoCoPi-roms.zip
wget -P /media/share1/roms http://rickadams.org/ronklein/CoCoPi-roms.md5

cd /media/share1/roms

if md5sum -c /media/share1/roms/CoCoPi-roms.md5; then

    echo -e
    echo -e "Download was successful.  File passed MD5 checksum."
    echo -e
    echo -e "Extracting files into /media/share1/roms..."
    echo -e
    unzip -o /media/share1/roms/CoCoPi-roms.zip -d /media/share1/roms 
    echo -e
    echo -e "Done!"
    echo -e
    read -p "Press any key to continue." -n1 -s

else

    echo -e
    echo -e "Download was unsuccessful.  File did not pass MD5 checksum."
    echo -e
    echo -e "Aborting."
    echo -e
    read -p "Press any key to continue." -n1 -s

fi

rm /media/share1/roms/CoCoPi-roms.zip
rm /media/share1/roms/CoCoPi-roms.md5

cd $HOME/.mame


