clear

echo -e "Prior to adjusting the volume, you can use the 'raspi-config' utility" > msg.txt
echo -e "to select your audio output source - HDMI or headphone jack (analog)" >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "alsa Mixer" --textbox msg.txt 0 0
rm msg.txt

alsamixer

cd $HOME/.mame

