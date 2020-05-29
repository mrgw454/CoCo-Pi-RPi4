#!/bin/bash
# backup Bluetooth settings

clear

echo -e "This script will place an archived copy of your Bluetooth pairing(s)" > msg.txt
echo -e "into /media/share1/bluetooth_pairings.tgz." >> msg.txt
echo -e >> msg.txt
echo -e "Existing pairing(s):" >> msg.txt
echo -e >> msg.txt

sudo find /var/lib/bluetooth/ -name info -exec cat {} + | grep Name >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Backup Bluetooth Pairing(s)" --textbox msg.txt 0 0
rm msg.txt

sudo rm /media/share1/bluetooth_pairings.tgz
sudo tar zcf /media/share1/bluetooth_pairings-$(date '+%Y-%m-%d').tgz /var/lib/bluetooth
sudo ln -s /media/share1/bluetooth_pairings-$(date '+%Y-%m-%d').tgz /media/share1/bluetooth_pairings.tgz

echo -e
read -p "Done!  Press any key to continue to continue." -n1 -s

cd $HOME/.mame

