# uncomment preferred web browser (only 1)
# WARNING - netsurf will not work on primary console - use [ALT][F2] to switch

export WEBBROWSER="lynx"
#export WEBBROWSER="netsurf-fb"

    clear
    RETVAL=$(whiptail --title "$(cat $HOME/cocopi-release.txt)" \
    --menu "\nPlease select from the following:" 18 65 10 \
    "1"  "Official CoCo-Pi Homepage" \
    "2"  "IRC (irssi)" \
    "3"  "qodem (Terminal program)" \
    "4"  "syncterm (Terminal program)" \
    "5"  "Coco Crew Podcast" \
    "6"  "CocoTALK Podcast" \
    "7"  "TRS-80 Color Computer Archive" \
    "8"  "maltedmedia.com" \
    "9"  "NitrOS9 Ease of Use Site" \
    "10"  "NitrOS9 - sourceforge (latest disk images)" \
    "11"  "rtsi.com" \
    "12"  "The ULTIMATE CoCoSDC Image!" \
    "13" "worldofdragon.org Archive" \
    "14"  "Building NitrOS9 Information" \
    "15" "Building Fuzix Information" \
    "16" "Building Fuzix Installation Project Utility" \
    "17" "Drivewire 4 command line (dw) commands" \
    "18" "pyDriveWire Information" \
    "19" "tcpser (modem emulator) Information" \
    "20" "MAME Universal Command Line Options" \
    "21" "XRoar Emulator Manual" \
    "22" "Fuzix for MOOH (XRoar)" \
    "23" "Return to Main Menu" \
    3>&1 1>&2 2>&3)

    # Below you can enter the corresponding commands

    case $RETVAL in
        1) $WEBBROWSER http://coco-pi.com/ && CoCoPi-menu-Online.sh;;
        2) irssi && CoCoPi-menu-Online.sh;;
        3) qodem && CoCoPi-menu-Online.sh;;
        4) syncterm && CoCoPi-menu-Online.sh;;
        5) $WEBBROWSER http://www.cococrew.org/ && CoCoPi-menu-Online.sh;;
        6) $WEBBROWSER http://cocotalk.live/podcasts/ && CoCoPi-menu-Online.sh;;
        7) $WEBBROWSER http://www.colorcomputerarchive.com/ && CoCoPi-menu-Online.sh;;
        8) $WEBBROWSER ftp://maltedmedia.com/coco/ && CoCoPi-menu-Online.sh;;
        9) $WEBBROWSER http://www.lcurtisboyle.com/nitros9/nitros9.html && CoCoPi-menu-Online.sh;;
       10) $WEBBROWSER https://nitros9.sourceforge.io/snapshot/ && CoCoPi-menu-Online.sh;;
       11) $WEBBROWSER ftp://www.rtsi.com/RSDOS/ && CoCoPi-menu-Online.sh;;
       12) $WEBBROWSER https://europa.lickwid.net/cocosdc/ && CoCoPi-menu-Online.sh;;
       13) $WEBBROWSER http://archive.worldofdragon.org/archive/index.php && CoCoPi-menu-Online.sh;;
       14) $WEBBROWSER https://nitros9.sourceforge.io/wiki/index.php/Building_NitrOS9#Obtain_and_build_NitrOS-9 && CoCoPi-menu-Online.sh;;
       15) $WEBBROWSER https://github.com/EtchedPixels/FUZIX/blob/master/Kernel/platform-coco3/README && CoCoPi-menu-Online.sh;;
       16) $WEBBROWSER https://github.com/beretta42/fip/blob/master/README.md && CoCoPi-menu-Online.sh;;
       17) $WEBBROWSER https://sourceforge.net/p/drivewireserver/wiki/The_%27dw%27_commands/ && CoCoPi-menu-Online.sh;;
       18) $WEBBROWSER https://github.com/n6il/pyDriveWire/blob/master/README.md && CoCoPi-menu-Online.sh;;
       19) $WEBBROWSER https://github.com/FozzTexx/tcpser/blob/master/README && CoCoPi-menu-Online.sh;;
       20) $WEBBROWSER https://docs.mamedev.org/commandline/commandline-all.html && CoCoPi-menu-Online.sh;;
       21) $WEBBROWSER https://www.6809.org.uk/xroar/doc/xroar.shtml && CoCoPi-menu-Online.sh;;
       22) $WEBBROWSER http://toolshed.sourceforge.net/fuzix/ && CoCoPi-menu-Online.sh;;
       23) menu;;
        *) echo "Quitting...";;
    esac
