    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 65 10 \
    "1"  "Sync to 'Box'" \
    "2"  "Sync to 'DropBox'" \
    "3"  "Sync to 'Google Drive'" \
    "4"  "Sync to 'Microsoft OneDrive'" \
    "5"  "Return to Utilities Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) $HOME/rclone/rclone-box.sh && CoCoPi-menu-rclone.sh;;
        2) $HOME/rclone/rclone-dropbox.sh && CoCoPi-menu-rclone.sh;;
        3) $HOME/rclone/rclone-google.sh && CoCoPi-menu-rclone.sh;;
        4) $HOME/rclone/rclone-microsoft.sh && CoCoPi-menu-rclone.sh;;
        5) CoCoPi-menu-Utilities.sh;;
        *) echo "Quitting...";;
    esac


