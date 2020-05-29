export NEWT_COLORS='
root=black,black
border=black,black
window=black,black
shadow=black,black
title=brightgreen,black
button=white,black
actbutton=black,white
checkbox=back,black
actcheckbox=black,black
entry=green,black
label=white,black
listbox=green,black
actlistbox=black,green
textbox=white,black
acttextbox=black,white
helpline=black
roottext=black
disentry=black,black
compactbutton=black,black
actsellistbox=black,green
sellistbox=green,black
'

clear

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

echo -e "Start modem emulator (tcpser)." > msg.txt
echo -e "More information about tcpser can be found here (https://github.com/FozzTexx/tcpser)." >> msg.txt
echo -e >> msg.txt
echo -e "When using with MAME, please make sure to change the serial port settings" >> msg.txt
echo -e "using MAME's UI (Machine Configuration) to match the tcpser parameters in this script." >> msg.txt
echo -e >> msg.txt
echo -e "This script should be run from a separate console." >> msg.txt
echo -e >> msg.txt

whiptail --title "Modem Emulator (tcpser)" --textbox msg.txt 0 0
rm msg.txt

cd $HOME/tcpser

# various command line options are listed below.  Only uncomment one at a time.

# This one works with MAME (emulation) and Coco's using a Deluxe RS-232 Pak in an MPI.  Set TWI-TERM baud rate to 9600 and MAME machine baud rate to 9600.
# twi-term requires TANDY for RS232 type and GIME for interrupt type in RS232C settings. 
tcpser -i "e1 k0 s0=1" -l 4 -v 6551 -s 2400 -p 6809 -tSs


# Left these here for other experimenting (some for emulation, some for real Coco's connected to the host
#tcpser -d /dev/ttyUSB1 -s 1200 -p 6809 -l 7 -tsSiI -B ./busy.txt -N ./no-answer.txt -T ./inactivity-timeout.txt -l 7 -tsSiI -i "X3S0=1&D2&C0&K0&S2=128"
#tcpser -l 4 -i "e0 &k0 s0=1" -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 &k0 &c1 &r1 &s0" -I -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 k0 s0=0" -I -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -i "e0" -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -l 7 -i "e1 &k0 &c1 &r1 &s0" -I -s 2400 -tSs -v 6551 -p 6809
#tcpser -l 7 -i "e1 &k0 &c1 &r1 &s0" -I -s 115200 -tSs -v 6551 -p 6809
#tcpser -i "e0 k0 s0=1" -l 4 -p 6809 -s 115200 -tSs -v 6551
#tcpser -d /dev/ttyUSB1 -s 1200 -p 6809 -l 7 -tsSiI -B ./busy.txt -N ./no-answer.txt -T ./inactivity-timeout.txt -l 7 -tsSiI -i "X3S0=1&D2&C0&K0&S2=128"
#tcpser -l 4 -i "e0 &k0 s0=1" -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 &k0 &c1 &r1 &s0" -I -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0" -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 &k3 s0=0" -I -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -i "e0" -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -d /dev/ttyUSB1 -s 1200 -p 6809 -l 7 -tsSiI -B ./busy.txt -N ./no-answer.txt -T ./inactivity-timeout.txt -l 7 -tsSiI -i "X3S0=1&D2&C0&K0&S2=128"
#tcpser -l 4 -i "e0 &k0 s0=1" -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 &k0 &c1 &r1 &s0" -I -s 1200 -tSs -v 6551 -d /dev/ttyUSB1
#tcpser -l 7 -i "e0" -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -l 7 -i "e0 &k3 s0=0" -I -s 1200 -tSs -d /dev/ttyUSB1
#tcpser -i "e0" -s 1200 -tSs -d /dev/ttyUSB1

# use this one with Mike Rowan's cable diagram
#tcpser -l 7 -i "e1 &k0 &c1 &r1 &s0" -I -s 1200 -tSs -v 6551 -d /dev/ttyUSB1

cd $HOME/.mame
