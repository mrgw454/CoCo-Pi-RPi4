clear

echo -e "Existing pairing(s):" > msg.txt
echo -e >> msg.txt

sudo find /var/lib/bluetooth/ -name info -exec cat {} + | grep Name >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Show Bluetooth Pairing(s)" --textbox msg.txt 0 0
rm msg.txt

cd $HOME/.mame

