    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 65 10 \
    "1" "Dragon 32" \
    "2" "Dragon 64" \
    "3" "Dragon 64 Plus" \
    "4" "Dragon 128 (Beta)" \
    "7" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) dragon32.sh;;
        2) dragon64.sh;;
        3) dragon64plus.sh;;
        4) dragon128.sh;;
        7) menu;;
        *) echo "Quitting...";;
    esac
