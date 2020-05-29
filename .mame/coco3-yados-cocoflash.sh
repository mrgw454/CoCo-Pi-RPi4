clear

# mount CCFLASH.dsk using the following YADOS DRIVE I command:
# DRIVE I 1,6,3

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

cp $HOME/.mame/cfg/coco3h.cfg.cart-start-disabled $HOME/.mame/cfg/coco3h.cfg

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw server hdbdos false

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 0
$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk insert 0 /media/share1/DW4/DW2HD/blank.dsk

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 1
$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk insert 1 /media/share1/DW4/DWHDD/DW2HD.DSK

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 2
$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk insert 2 /media/share1/DW4/YADOS/yados.dsk

mame coco3h -ramsize 512k -cart /media/share1/roms/yados.rom -ext fdcv11 -hard1 /media/share1/DW4/CCFLASH/CCFLASH.dsk $MAMEPARMS

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 0
$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 1
$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw disk eject 2

$HOME/pyDriveWire/pyDwCli http://localhost:6800 dw server hdbdos true

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

cp $HOME/.mame/cfg/coco3h.cfg.cart-start-enabled $HOME/.mame/cfg/coco3h.cfg

cd $HOME/.mame
#CoCoPi-menu-Coco3.sh
