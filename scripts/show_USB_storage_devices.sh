echo
echo

echo Devices:
echo

while read mtabline
do
  device=`echo $mtabline | awk '{print $1}'`
  udevline=`udevadm info -q path -n $device 2>&1 |grep usb` 
  if [ $? == 0 ] ; then
    echo "$device"
  fi
done < /etc/mtab

echo
echo


echo Mount points:
echo

export USBKEYS=($(
    for blk in $(lsblk -ndo name) ; do {
        udevadm info --query=all --name "/dev/$blk" |\
        grep -q ID_BUS=usb &&
            printf 'findmnt %s -no TARGET ;'\
                "/dev/$blk" /dev/"$blk"[0-9]
        } ; done 2>&- |. /dev/stdin 
))
echo "$USBKEYS"
export STICK
case ${#USBKEYS[@]} in
    0 ) echo "No USB storage found."; exit 0 ;;
    1 ) STICK=$USBKEYS; echo "STICK=$USBKEYS" ;;
esac

echo
echo

