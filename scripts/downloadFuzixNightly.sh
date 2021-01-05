#!/bin/bash

clear

echo -e
echo -e "This script will download the latest Fuzix nightly or tested build."
echo -e
echo -e "Nightly - may or may not work from day to day."
echo -e "Tested  - will boot and most things should be working."
echo -e
echo -e "Warning!  Existing Fuzix installation will be overwritten."
echo -e

PS3='Please enter your choice: '
options=("Fuzix nightly" "Fuzix tested" "Cancel")
select opt in "${options[@]}"
do
    case $opt in
        "Fuzix nightly")
	    wget -c -P /media/share1/DW4/GORDON/FUZIX http://fuzix.play-classics.online/fuzix-nightly.zip
	    cd /media/share1/DW4/GORDON/FUZIX
	    echo -e
    	    unzip -o /media/share1/DW4/GORDON/FUZIX/fuzix-nightly.zip
            rm /media/share1/DW4/GORDON/FUZIX/fuzix-nightly.zip
            echo -e
            echo -e "Done!"
            echo -e
            read -p "Press any key to continue." -n1 -s
            break
	    ;;
        "Fuzix tested")
	    wget -c -P /media/share1/DW4/GORDON/FUZIX http://fuzix.play-classics.online/fuzix-tested.zip
	    cd /media/share1/DW4/GORDON/FUZIX
	    echo -e
    	    unzip -o /media/share1/DW4/GORDON/FUZIX/fuzix-tested.zip
            rm /media/share1/DW4/GORDON/FUZIX/fuzix-tested.zip
            echo -e
            echo -e "Done!"
            echo -e
            read -p "Press any key to continue." -n1 -s
	    break
            ;;
        "Cancel")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

cd $HOME/.mame
