clear

echo -e "If using a Bluetooth controller, please read the following file in" >> test-controller.txt
echo -e "/media/share1/docs to learn how to pair and connect a Bluetooth" >> test-controller.txt
echo -e "controller to the RPi3:" >> test-controller.txt 
echo -e >> test-controller.txt
echo -e "Pairing WiiU Pro Controller to Raspberry Pi 3.txt" >> test-controller.txt
echo -e >> test-controller.txt
echo -e "Make sure your BT game controller is paired and connected OR your wired" >> test-controller.txt
echo -e "USB game controller is connected to the RPi3 before continuing." >> test-controller.txt
echo -e >> test-controller.txt
echo -e >> test-controller.txt

whiptail --title "Test Game Controller" --textbox test-controller.txt 0 0
rm test-controller.txt

clear

echo
echo
echo
echo
echo
echo
echo
echo

if [ -e /dev/input/js0 ]
then

	jstest /dev/input/js0

else

	echo
	echo
	echo
        echo "No controller detected."
	echo
	read -p  "Press any key to continue." -n1 -s

fi

cd $HOME/.mame

