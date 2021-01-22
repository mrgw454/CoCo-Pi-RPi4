clear

echo
echo Retrieving status information...
echo

RPI=$(tr -d '\0' </proc/device-tree/model)

my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

echo -e > status.txt

echo -e Device: $RPI >> status.txt
echo -e >> status.txt

echo -e "[ALT][F1] - [ALT][F6] to toggle consoles" >> status.txt
echo -e >> status.txt
PiUpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo -e "System Uptime: $PiUpTime" >> status.txt
echo -e >> status.txt
echo -e "Your IP address(es) are: " >> status.txt ; hostname -I >> status.txt 
echo -e >> status.txt

#SDspace=$(df -h | grep root)
SDspace=$(df -H | grep -vE '^Filesystem|tmpfs|cdrom|//|cgmfs' | awk '{ print $5 " " $1 }')

echo -e "Storage information:" >> status.txt
echo -e "$SDspace" >> status.txt
echo -e >> status.txt

checkDW4-lwwire-pyDW.sh >> status.txt

echo -e "Use URL http://$my_ip:6800 to manage pyDriveWire server" >> status.txt
echo -e >> status.txt
echo -e "Use $my_ip:6800 to manage in DriveWire GUI" >> status.txt
echo -e >> status.txt
echo -e >> status.txt

#whiptail --title "RPi3 System Status" --textbox status.txt 0 0
whiptail --textbox status.txt 0 0

rm status.txt

cd $HOME/.mame


