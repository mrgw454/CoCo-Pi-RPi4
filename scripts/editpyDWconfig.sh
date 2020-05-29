clear

echo
echo
echo
echo
echo
echo
echo
echo

echo -e "*** CAUTION!!! ****" > msg.txt
echo -e >> msg.txt
echo -e "Editing this file incorrectly will prevent pyDriveWire from working correctly." >> msg.txt
echo -e >> msg.txt
echo -e "More information about the pyDriveWire configuration can be found at:" >> msg.txt
echo -e >> msg.txt
echo -e "https://github.com/n6il/pyDriveWire/blob/master/docs/The%20pyDriveWire%20Manual.md#ch7" >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt


whiptail --title "Edit /home/pi/.pydrivewirerc" --textbox msg.txt 0 0
rm msg.txt

nano $HOME/.pydrivewirerc

cd $HOME/.mame

