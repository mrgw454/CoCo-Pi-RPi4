clear

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

cd $HOME/.mame

# hdbdos method
mame coco3dw1 -ramsize 2048k -autoboot_delay 2 -autoboot_command '2' $MAMEPARMS

# yados method
#mame coco3h -ramsize 2048k -cart /media/share1/roms/yados.rom -ext fdcv11 -autoboot_delay 2 -autoboot_command '2' $MAMEPARMS

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

cd $HOME/.mame
CoCoPi-menu-Coco3.sh
