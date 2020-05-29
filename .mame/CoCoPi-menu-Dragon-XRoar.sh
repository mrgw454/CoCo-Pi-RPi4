    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 65 10 \
    "1" "Dragon 32" \
    "2" "Dragon 64" \
    "3" "Dragon 200e" \
    "4" "Dragon Tano (NTSC)" \
    "5" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) $HOME/.xroar/dragon32-xroar.sh;;
        2) $HOME/.xroar/dragon64-xroar.sh;;
        3) $HOME/.xroar/dragon200e-xroar.sh;;
        4) $HOME/.xroar/dragontano-xroar.sh;;
        5) menu;;
        *) echo "Quitting...";;
    esac
