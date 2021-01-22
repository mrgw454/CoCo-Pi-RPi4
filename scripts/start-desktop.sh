clear

RPI=`cat /proc/device-tree/model | cut -c14`

echo W-windows desktop will now be started.  To exit back to console,
echo select the "Exit X-Windows Desktop" on the Utilities Menu.
echo
echo At the black screen, press [CTRL-F1]
echo Type 'menu'
echo
echo
read -p "Press any key to continue... " -n1 -s
echo

 if [[ "$RPI" == 4 ]]; then
	sudo systemctl start lightdm
 fi


 if [[ "$RPI" == 3 ]]; then
	startx
 fi





