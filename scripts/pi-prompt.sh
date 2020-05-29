ip=$(ifconfig wlan0 | grep "inet " | awk -F'[: ]+' '{ print $3 }')

echo $ip

host $ip | tail -n 1 | sed -e "s/^.* //;s/[[:punct:]]*$//"
