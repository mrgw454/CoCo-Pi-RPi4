clear

RPI=`cat /proc/device-tree/model | cut -c14`

 if [[ "$RPI" == 4 ]]; then
        sudo systemctl stop lightdm
 fi


 if [[ "$RPI" == 3 ]]; then
        pkill x
 fi

