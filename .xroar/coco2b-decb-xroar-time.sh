clear

cd $HOME/.xroar

XROARPARMSFILE=`cat $HOME/.xroar/.optional_xroar_parameters.txt`
export XROARPARMS=$XROARPARMSFILE

echo " TRS-80 Color Computer 2 w/64K RAM using standard DECB\n \
with 20 second timeout for testing emulation speed\n\n" > msg.txt

whiptail --title "XRoar Emulator" --textbox msg.txt 0 0
rm msg.txt

#time xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -ao-fragments 1 -timeout 20
time xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -timeout 20 $XROARPARMS
read -n 1 -s -r -p "Press any key to continue"

cd $HOME/.mame
CoCoPi-menu-Coco2-XRoar.sh
