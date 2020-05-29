#!/bin/bash
# backup emulator configuration files

clear

echo -e "This script will place an archived copy of your emulator configuration" > msg.txt
echo -e "files into /media/share1/backupEMUConfigs.tar.gz." >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Backup Emulator Configuration Files" --textbox msg.txt 0 0
rm msg.txt

rm /media/share1/backupEMUConfigs.tar.gz
tar czvf /media/share1/backupEMUConfigs-$(date '+%Y-%m-%d').tar.gz $HOME/.mame/*.ini $HOME/.mame/cfg/* $HOME/.xroar/*.conf
ln -s /media/share1/backupEMUConfigs-$(date '+%Y-%m-%d').tar.gz /media/share1/backupEMUConfigs.tar.gz

echo -e
read -p "Done!  Press any key to continue to continue." -n1 -s

cd $HOME/.mame
