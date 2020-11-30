clear

echo
echo
echo
echo
echo
echo
echo
echo

echo Clearing all MAME and XRoar saved mount files...
echo
rm $HOME/.mame/.mame_floppy
rm $HOME/.mame/.mame_rom
rm $HOME/.xroar/.xroar_bin
rm $HOME/.xroar/.xroar_cassette
rm $HOME/.xroar/.xroar_floppy
rm $HOME/.xroar/.xroar_rom
echo Done!
echo
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame


