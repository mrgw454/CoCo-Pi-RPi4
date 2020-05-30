    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 70 10 \
    "1"  "System Status" \
    "2"  "Start     pyDriveWire server" \
    "3"  "Stop      pyDriveWire server" \
    "4"  "Edit      pyDriveWire configuration" \
    "5"  "Restart   Drivewire 4" \
    "6"  "Stop      Drivewire 4" \
    "7"  "Start     lwwire (Use option 9 prior to running)" \
    "8"  "Stop      lwwire" \
    "9"  "Edit      lwwire configuration" \
    "10" "Start     emceed file server (MC-10)" \
    "11" "Stop      emceed file server (MC-10)" \
    "12" "Start     tcpser (modem emulator)" \
    "13" "Stop      tcpser (modem emulator)" \
    "14" "Edit      tcpser (modem emulator) script" \
    "15" "Mount     DSK image in Drivewire" \
    "16" "Mount     DSK image in pyDriveWire" \
    "17" "Mount     DSK image in MAME" \
    "18" "Mount     DSK image in XRoar" \
    "19" "Mount     CASSETTE image in XRoar" \
    "20" "Mount     BIN image in XRoar" \
    "21" "Mount     ROM image in XRoar" \
    "22" "Show      all saved mount files" \
    "23" "Clear     all saved mount files" \
    "24" "Select    default YA-DOS HDD image" \
    "25" "Select    MAME version" \
    "26" "Select    XRoar version" \
    "27" "Edit      optional MAME parameters (CAUTION)" \
    "28" "Edit      optional XRoar parameters (CAUTION)" \
    "29" "Edit      WiFi configuration" \
    "30" "Edit      pyDriveWire configuration" \
    "31" "Adjust    RPi audio volume" \
    "32" "Test      Bluetooth/USB Game Controller" \
    "33" "Run       Raspi-Config Script" \
    "34" "Edit      /boot/config.txt (DANGEROUS)" \
    "35" "Sync      Cloud Services" \
    "36" "Show      Existing Bluetooth Pairing(s)" \
    "37" "Backup    Existing Bluetooth Pairing(s)" \
    "38" "Restore   Bluetooth Pairing(s) from Archive" \
    "39" "Show      Existing Emulator Configuration File(s)" \
    "40" "Backup    Existing Emulator Configuration File(s)" \
    "41" "Restore   Emulator Configuration File(s) from Archive" \
    "42" "Backup    RPi to alternate SD card" \
    "43" "Download  ROM images to /media/share1/roms" \
    "44" "Download  Latest Fuzix Nightly image" \
    "45" "Download  Latest NitrOS9 EOU image" \
    "46" "Download  Latest UltimateSDC image" \
    "47" "Reboot    Raspberry Pi" \
    "48" "Shutdown  Raspberry Pi" \
    "49" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) status.sh && CoCoPi-menu-Utilities.sh;;
        2) $HOME/pyDriveWire/start_pyDW.sh && CoCoPi-menu-Utilities.sh;;
        3) $HOME/pyDriveWire/stop_pyDW.sh && CoCoPi-menu-Utilities.sh;;
        4) nano $HOME/.pydrivewirerc && CoCoPi-menu-Utilities.sh;;
        5) $HOME/DriveWire4/restartDW4.sh && CoCoPi-menu-Utilities.sh;;
        6) $HOME/DriveWire4/stopDW4.sh && CoCoPi-menu-Utilities.sh;;
        7) $HOME/lwwire/startlwwire.sh && CoCoPi-menu-Utilities.sh;;
        8) $HOME/lwwire/stoplwwire.sh && CoCoPi-menu-Utilities.sh;;
        9) $HOME/lwwire/edit-tcpserv.sh && CoCoPi-menu-Utilities.sh;;
        10) $HOME/emceed/start_emceed.sh && CoCoPi-menu-Utilities.sh;;
        11) $HOME/emceed/stop_emceed.sh && CoCoPi-menu-Utilities.sh;;
        12) $HOME/tcpser/start_tcpser.sh && CoCoPi-menu-Utilities.sh;;
        13) $HOME/tcpser/stop_tcpser.sh && CoCoPi-menu-Utilities.sh;;
        14) nano $HOME/tcpser/start_tcpser.sh && CoCoPi-menu-Utilities.sh;;
        15) mountDWfile.sh 0 0 && CoCoPi-menu-Utilities.sh;;
        16) mountpyDWfile.sh 0 0 && CoCoPi-menu-Utilities.sh;;
        17) mountFloppy.sh /media/share1/ && CoCoPi-menu-Utilities.sh;;
        18) mountXRoarFloppy.sh /media/share1/ && CoCoPi-menu-Utilities.sh;;
        19) mountXRoarCassette.sh /media/share1/cassette/ && CoCoPi-menu-Utilities.sh;;
        20) mountXRoarBin.sh /media/share1/ && CoCoPi-menu-Utilities.sh;;
        21) mountXRoarROM.sh /media/share1/roms/ && CoCoPi-menu-Utilities.sh;;
        22) mountShow.sh && CoCoPi-menu-Utilities.sh;;
        23) mountClear.sh && CoCoPi-menu-Utilities.sh;;
        24) select-hdd.sh && CoCoPi-menu-Utilities.sh;;
        25) select-emu.sh && CoCoPi-menu-Utilities.sh;;
        26) select-xroar.sh && CoCoPi-menu-Utilities.sh;;
        27) editMAMEparms.sh && CoCoPi-menu-Utilities.sh;;
        28) editXROARparms.sh && CoCoPi-menu-Utilities.sh;;
        29) editWiFi.sh && CoCoPi-menu-Utilities.sh;;
        30) editpyDWconfig.sh && CoCoPi-menu-Utilities.sh;;
        31) adjustVol.sh && CoCoPi-menu-Utilities.sh ;;
        32) test-controller.sh && CoCoPi-menu-Utilities.sh;;
	33) runRaspiConfig.sh && CoCoPi-menu-Utilities.sh;;
	34) editConfig-txt.sh && CoCoPi-menu-Utilities.sh;;
        35) CoCoPi-menu-rclone.sh;;
        36) showBluetoothPairings.sh && CoCoPi-menu-Utilities.sh;;
        37) backupBluetoothPairings.sh && CoCoPi-menu-Utilities.sh;;
        38) restoreBluetoothPairings.sh && CoCoPi-menu-Utilities.sh;;
        39) showEMUConfigs.sh && CoCoPi-menu-Utilities.sh;;
        40) backupEMUConfigs.sh && CoCoPi-menu-Utilities.sh;;
        41) restoreEMUConfigs.sh && CoCoPi-menu-Utilities.sh;;
        42) backupSD.sh && CoCoPi-menu-Utilities.sh;;
        43) downloadROMs.sh && CoCoPi-menu-Utilities.sh;;
        44) downloadFuzixNightly.sh && CoCoPi-menu-Utilities.sh;;
        45) downloadNitrOS9EOU.sh && CoCoPi-menu-Utilities.sh;;
        46) downloadUltimateSDC.sh && CoCoPi-menu-Utilities.sh;;
        47) rebootRPi.sh;;
        48) shutdownRPi.sh;;
        49) menu;;
        *) echo "Quitting...";;
    esac