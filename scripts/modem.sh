#!/bin/bash

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

echo " Tandy Color Computer 2 or 3 with serial communication (i.e. BBS)\n\n \
Please review batch file and uncomment appropriate line\n \
Requires use of 'tcpser' utility\n\n \
When using with tcpser, please make sure to change the serial port settings\n \
using MAME's UI (Machine Configuration) to match the tcpser parameters\n\n\n" > msg.txt

whiptail --title "MAME Emulator" --textbox msg.txt 0 0
rm msg.txt

# this script is used to launch MAME while providing virtual modem connectivity.
# it uses the program 'tcpser' (https://github.com/FozzTexx/tcpser)

# IMPORTANT!  This only works when using MPI/Deluxe RS232 Pak support, not bit-banger.  Terminal programs that make use of the high speed POKE will not work, either.


# use parameter file for MAME (if found)
MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

# Use this for a Coco 2 using a bit-banger port.  Make sure to match the baud rate in MAME using the UI (Machine Configuration)
#mame coco2b -rs232 null_modem -bitb socket.localhost:6551 -flop1 /media/share1/SDC/COMM/GETERM25.DSK -autoboot_delay 2 -autoboot_command 'LOADM"GETERM.BIN":EXEC\n' $MAMEPARMS

#Use this for a Coco 2 using a Deluxe RS-232 Pak and MultiPak Interface.  Make sure to match the baud rate in MAME using the UI (Machine Configuration)
mame coco2 -ext multi -ext:multi:slot1 rs232 -ext multi -ext:multi:slot1:rs232:port null_modem -bitb socket.localhost:6551 -flop1 /media/share1/SDC/COMM/GETERM25.DSK -autoboot_delay 2 -autoboot_command 'LOADM"GETERM.BIN":EXEC\n' $MAMEPARMS


# Use this for a Coco 3 using a bit-banger port.  Make sure to match the baud rate in MAME using the UI (Machine Configuration)
#mame coco3 -rs232 null_modem -bitb socket.localhost:6551 -flop1 /media/share1/SDC/COMM/TWITERM.DSK -autoboot_delay 2 -autoboot_command 'LOADM"TWI-TERM.BIN":EXEC\n' $MAMEPARMS

# Use this for a Coco 3 using a bit-banger port.  Make sure to match the baud rate in MAME using the UI (Machine Configuration)
#mame coco3 -rs232 null_modem -bitb socket.localhost:6551 -flop1 /media/share1/SDC/TAYLOR/netmate.dsk -autoboot_delay 2 -autoboot_command 'LOADM"NET.BIN":EXEC\n' $MAMEPARMS

# Use this for a Coco 3 using a Deluxe RS-232 Pak and MultiPak Interface.  Make sure to match the baud rate in MAME using the UI (Machine Configuration)
#mame coco3 -ext multi -ext:multi:slot1 rs232 -ext multi -ext:multi:slot1:rs232:port null_modem -bitb socket.localhost:6551 -flop1 /media/share1/SDC/TAYLOR/netmate.dsk -autoboot_delay 2 -autoboot_command 'LOADM"NET.BIN":EXEC\n' $MAMEPARMS


# Use this for a Coco 3 using a bit-banger port.  Make sure to match the baud rate in MAME using the UI (Machine Configuration).  All ouput from Coco is redirected to a text filed called "serial-output.txt"
#mame coco3 -rs232 null_modem -bitb $HOME/.mame/serial-output.txt -flop1 /media/share1/SDC/COMM/TWITERM.DSK -autoboot_delay 2 -autoboot_command 'LOADM"TWI-TERM.BIN":EXEC\n' $MAMEPARMS

# Use this for a Coco 2 using a bit-banger port.  Make sure to match the baud rate in MAME using the UI (Machine Configuration).  All ouput from Coco is redirected to a text filed called "serial-output.txt"
#mame coco2b -rs232 null_modem -bitb $HOME/.mame/serial-output.txt -flop1 /media/share1/SDC/COMM/GETERM25.DSK -autoboot_delay 2 -autoboot_command 'LOADM"GETERM.BIN":EXEC\n' $MAMEPARMS


# capture MAME ERRORLEVEL

if [ $? -eq 0 ]
then
        echo
else
        echo
        echo "Please make note of message above when requesting help."
        echo
        read -p  "Press any key to continue." -n1 -s
fi
