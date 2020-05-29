# loop over TI-99/4a cartridges and run them for 60 seconds each

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

shopt -s extglob

for f in `ls /media/share1/software/ti99_cart/*.zip`

	do
		clear
                echo
                echo
                echo
                echo
                echo
                echo
                echo
                echo

		echo file = "$f"
                echo
                echo Press [CTRL][C] to BREAK out of ATTRACT mode.
		sleep 2
		mame ti99_4a ${f//+(*\/|.*)} -ioport peb -ioport:peb:slot4 samsmem -ioport:peb:slot5 tirs232 -ioport:peb:slot7 tifdc -seconds_to_run 60 -autoboot_delay 2 -autoboot_command '\n2' $MAMEPARMS
	done

cd $HOME/.mame

