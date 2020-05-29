clear

echo
echo
echo
echo
echo
echo
echo
echo

echo Listing all MAME and XRoar saved mount files...
echo

if [ -e $HOME/.mame/.mame_floppy ]
then
    floppy=`cat $HOME/.mame/.mame_floppy`

    if [ -e "$floppy" ]
    then

        echo "FLOPPY disk mount file found for MAME: [$floppy]"

    else

        echo "FLOPPY disk mount file not in FLOPPY save file.  Aborting."

    fi

else

    echo "FLOPPY disk mount file empty for MAME."

fi


if [ -e $HOME/.xroar/.xroar_bin ]
then
    bin=`cat $HOME/.xroar/.xroar_bin`

    if [ -e "$bin" ]
    then

        echo "BIN image mount file found for XRoar: [$bin]"

    else

        echo "BIN image mount file not in BIN save file.  Aborting."

    fi

else

    echo "BIN image mount file empty for XRoar."

fi


if [ -e $HOME/.xroar/.xroar_cassette ]
then
    cassette=`cat $HOME/.xroar/.xroar_cassette`

    if [ -e "$cassette" ]
    then

        echo "CASSETTE image mount file found for XRoar: [$cassette]"

    else

        echo "CASSETTE image mount file not in CASSETTE save file.  Aborting."

    fi

else

    echo "CASSETTE image mount file empty for XRoar."

fi


if [ -e $HOME/.xroar/.xroar_floppy ]
then
    floppy=`cat $HOME/.xroar/.xroar_floppy`

    if [ -e "$floppy" ]
    then

        echo "FLOPPY image mount file found for XRoar: [$floppy]"

    else

        echo "FLOPPY image mount file not in FLOPPY save file.  Aborting."

    fi

else

    echo "FLOPPY image mount file empty for XRoar."

fi


if [ -e $HOME/.xroar/.xroar_rom ]
then
    rom=`cat $HOME/.xroar/.xroar_rom`

    if [ -e "$rom" ]
    then

        echo "ROM image mount file found for XRoar: [$rom]"

    else

        echo "ROM image mount file not in ROM save file.  Aborting."

    fi

else

    echo "ROM image mount file empty for XRoar."

fi


echo
echo

echo Done!
echo
read -p "Press any key to continue." -n1 -s

cd $HOME/.mame


