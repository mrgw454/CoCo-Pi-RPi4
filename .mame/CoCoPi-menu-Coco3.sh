    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 75 10 \
    "1" "Tandy Color Computer 3 DECB" \
    "2" "Tandy Color Computer 3 DECB w/6309,2MB" \
    "3" "Tandy Color Computer 3 DECB w/SSC & MPI" \
    "4" "Tandy Color Computer 3 DECB w/GameMaster" \
    "5" "Tandy Color Computer 3 DECB w/Deluxe RS-232 Pak" \
    "6" "Tandy Color Computer 3 HDB-DOS" \
    "7" "Tandy Color Computer 3 HDB-DOS w/6309" \
    "8" "Tandy Color Computer 3 HDB-DOS w/6309,2MB & NitrOS9 EOU" \
    "9" "Tandy Color Computer 3 HDB-DOS w/6309 & Fuzix" \
    "10" "Tandy Color Computer 3 HDB-DOS w/PLATO" \
    "11" "Tandy Color Computer 3 YA-DOS w/HDD" \
    "12" "Tandy Color Computer 3 YA-DOS w/6309,2MB & HDD" \
    "13" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) coco3-decb.sh;;
        2) coco3-decb-6309-2MB.sh;;
        3) coco3-decb-ssc-mpi.sh;;
        4) coco3-decb-gamemaster.sh;;
        5) coco3-decb-term.sh;;
        6) coco3-hdbdos.sh;;
        7) coco3-hdbdos-6309.sh;;
        8) coco3-hdbdos-6309-nitros9.sh;;
        9) coco3-Fuzix-pyDW.sh;;
       10) coco3-hdbdos-pyDW-PLATO.sh;;
       11) coco3-yados-HD.sh;;
       12) coco3-yados-HD-6309.sh;;
       13) menu;;
        *) echo "Quitting...";;
    esac
