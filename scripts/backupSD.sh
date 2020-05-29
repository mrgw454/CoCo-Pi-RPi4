clear

echo -e "Backup existing RPi installation to alternate SD card" > msg.txt
echo -e >> msg.txt
echo -e "In order to use this utility, you must insert an SD card into one of the" >> msg.txt
echo -e "USB ports (using an adapter).  All data on the destination SD card will be" >> msg.txt
echo -e "destroyed." >> msg.txt
echo -e >> msg.txt
echo -e "You only need an SD card large enough for your existing installation" >> msg.txt
echo -e "(which can be smaller than the original).  You will receive an error" >> msg.txt
echo -e "if there is not enough room on the destination SD card." >> msg.txt
echo -e >> msg.txt
echo -e "More information about 'rpi-clone' can be found at:" >> msg.txt
echo -e >> msg.txt
echo -e "https://github.com/billw2/rpi-clone" >> msg.txt
echo -e >> msg.txt

whiptail --title "rpi-clone" --textbox msg.txt 0 0
rm msg.txt

cd $HOME/source/rpi-clone

# umount auto-mounted USB device prior to backup (change device as per your needs)
sudo umount /media/boot_sda1
sudo umount /media/CoCoPi_sda2

#sudo ./rpi-clone sda -f -v
sudo ./rpi-clone sda -v -L CoCoPi

echo
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame

