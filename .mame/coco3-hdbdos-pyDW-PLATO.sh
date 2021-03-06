clear

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

cp $HOME/.mame/cfg/coco3dw1.cfg.artifacting.disabled $HOME/.mame/cfg/coco3dw1.cfg

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 0

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk insert 0 /media/share1/DW4/GORDON/plato.dsk

mame coco3dw1 -ramsize 2048k $MAMEPARMS

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

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 0

cp $HOME/.mame/cfg/coco3dw1.cfg.artifacting.enabled $HOME/.mame/cfg/coco3dw1.cfg

cd $HOME/.mame
CoCoPi-menu-Coco3.sh

