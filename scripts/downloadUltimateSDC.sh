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
echo -e "This script will download the 'Ultimate' CoCoSDC Image."
echo -e
echo -e "Please make a backup of all your files in /media/share1/SDC"
echo -e "as any existing file(s) will be overwritten."
echo -e
echo -e "Press [CTRL-C] to cancel script or ..."
echo -e
read -p "... Press any key to continue." -n1 -s
echo -e
echo -e
echo -e "Downloading ROM files..."
echo -e
wget -P /media/share1/SDC "http://www.colorcomputerarchive.com/coco/Disks/Coco%20SDC/Image/Coco SDC Image (2019-05-02).zip"

cd /media/share1/SDC

    echo -e "Extracting files into /media/share1/SDC..."
    echo -e
    unzip -o "/media/share1/SDC/Coco SDC Image (2019-05-02).zip" -d /media/share1/SDC
    echo -e
    echo -e "Done!"
    echo -e
    read -p "Press any key to continue." -n1 -s

rm "/media/share1/SDC/Coco SDC Image (2019-05-02).zip"

cd $HOME/.mame


