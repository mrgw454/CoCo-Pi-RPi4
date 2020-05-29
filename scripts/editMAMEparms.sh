clear

echo -e "Any parameters you add/change/remove from this file will be applied to most" > msg.txt
echo -e "MAME launch scripts as part of CoCoPi." >> msg.txt
echo -e >> msg.txt
echo -e "More information about MAME command line options can be found at:" >> msg.txt
echo -e >> msg.txt
echo -e "https://docs.mamedev.org/commandline/commandline-all.html" >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Edit optional MAME parameters" --textbox msg.txt 0 0
rm msg.txt

nano $HOME/.mame/.optional_mame_parameters.txt

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE
set MAMEPARMS=$MAMEPARMSFILE

clear

echo
echo
echo
echo
echo
echo
echo
echo

echo MAME optional parameters are set to:
echo
echo $MAMEPARMS
echo
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame
