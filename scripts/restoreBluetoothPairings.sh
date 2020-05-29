clear

echo -e "This script will restore an archived copy of your Bluetooth pairing(s)" > msg.txt
echo -e "from /media/share1/bluetooth_pairings.tgz." >> msg.txt
echo -e >> msg.txt
echo -e "WARNING - this will overwrite any existing pairing(s)!" >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Restore Bluetooth Pairing(s)" --textbox msg.txt 0 0
rm msg.txt

if [ -e /media/share1/bluetooth_pairings.tgz ]
then

	read -p "Press any key to continue to continue or [CTRL-C] to abort." -n1 -s
        sudo tar xzf /media/share1/bluetooth_pairings.tgz -C /

else

        echo
        echo
        echo
        echo "No archived Bluetooth pairing(s) file found."
        echo
        read -p  "Press any key to continue." -n1 -s

fi

cd $HOME/.mame

