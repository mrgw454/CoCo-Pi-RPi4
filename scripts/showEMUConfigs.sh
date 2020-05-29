#!/bin/bash
# backup emulator configuration files

clear

ls -l $HOME/.mame/*.ini > msg.txt
ls -l $HOME/.mame/*.cfg >> msg.txt
ls -l $HOME/.mame/cfg/*.cfg >> msg.txt
ls -Rl $HOME/.xroar/*.conf >> msg.txt
echo -e >> msg.txt
echo -e >> msg.txt

whiptail --title "Show Emulator Configuration File(s)" --textbox msg.txt 0 0
rm msg.txt

cd $HOME/.mame
