clear

echo -e "The lwwire daemon will provide Internet access to Fuzix via" > msg.txt
echo -e "the 'netd-lwwire' command in Fuzix." >> msg.txt
echo -e >> msg.txt
echo -e "It is recommended you switch to an alternate console screen" >> msg.txt
echo -e "by using [ALT][F2] through [ALT][F6] and run this command from there." >> msg.txt
echo -e >> msg.txt
echo -e "Return to the main console [ALT][F1] prior to launching" >> msg.txt
echo -e "Coco 3 with Fuzix." >> msg.txt

whiptail --title "lwwire Daemon" --textbox msg.txt 0 0
rm msg.txt

cd $HOME/lwwire
sudo ./tap-enable.sh

sleep 3s

cd $HOME/.mame

