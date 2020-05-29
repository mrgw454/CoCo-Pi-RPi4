clear

echo -e "Any parameters you add/change/remove from this file will be applied to most" > msg.txt
echo -e "XRoar launch scripts as part of CoCoPi." >> msg.txt
echo -e >> msg.txt
echo -e "More information about XRoar command line options can be found at:" >> msg.txt
echo -e >> msg.txt
echo -e "http://www.6809.org.uk/xroar/doc/xroar.shtml" >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Edit optional XRoar parameters" --textbox msg.txt 0 0
rm msg.txt

nano $HOME/.xroar/.optional_xroar_parameters.txt

XROARPARMSFILE=`cat $HOME/.xroar/.optional_xroar_parameters.txt`
export XROARPARMS=$XROARPARMSFILE
set XROARPARMS=$XROARPARMSFILE

clear

echo
echo
echo
echo
echo
echo
echo
echo

echo XRoar optional parameters are set to:
echo
echo $XROARPARMS
echo
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame
