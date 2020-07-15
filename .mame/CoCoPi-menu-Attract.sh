    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 70 10 \
    "1" "Coco 2 MAME     Attract Mode Games (random)" \
    "2" "Coco 2 MAME     Attract Mode Carts (random)" \
    "3" "Coco 3 MAME     Attract Mode Games (random)" \
    "4" "Coco 3 MAME     Attract Mode Carts (random)" \
    "5" "Coco 2 XRoar    Attract Mode Games (random)" \
    "6" "Coco 2 XRoar    Attract Mode Carts (random)" \
    "7" "Dragon 32 MAME  Attract Mode (random)" \
    "8" "Dragon 32 XRoar Attract Mode (random)" \
    "9" "Coco 3 MAME     Image Slideshow" \
    "10" "Coco 3 MAME     CoCoTracker Demo" \
    "11" "MAME            Play Donkey Kong Hacks" \
    "12" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) attract-mode-random-coco2.sh /media/share1/coco/games/coco2 && CoCoPi-menu-Attract.sh;;
        2) attract-mode-random-coco2.sh /media/share1/carts && CoCoPi-menu-Attract.sh;;
        3) attract-mode-random-coco3.sh /media/share1/coco/games/coco3 && CoCoPi-menu-Attract.sh;;
        4) attract-mode-random-coco3.sh /media/share1/carts && CoCoPi-menu-Attract.sh;;
        5) attract-mode-random-coco2-xroar.sh /media/share1/coco/games/coco2 && CoCoPi-menu-Attract.sh;;
        6) attract-mode-random-coco2-xroar.sh /media/share1/carts && CoCoPi-menu-Attract.sh;;
        7) attract-mode-random-dragon.sh && CoCoPi-menu-Attract.sh;;
        8) attract-mode-random-dragon-xroar.sh && CoCoPi-menu-Attract.sh;;
        9) attract-mode-gallery.sh && CoCoPi-menu-Attract.sh;;
       10) attract-mode-ORCH90.sh && CoCoPi-menu-Attract.sh;;
       11) attract-mode-dkong.sh && CoCoPi-menu-Attract.sh;;
       12) menu;;
        *) echo "Quitting...";;
    esac

