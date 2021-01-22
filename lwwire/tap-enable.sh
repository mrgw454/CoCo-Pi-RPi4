# Do something like this:
#
# init a tap interface
ip tuntap add tap0 mode tap user root
ip addr add 192.168.42.1/24 dev tap0
ip link set dev tap0 up

# make linux do NAT (replace wlan0 with your extern interface)
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o tap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i tap0 -o wlan0 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

# start lwwire
cd /home/pi/lwwire

# bitbanger (serial) connection
#./serserv

# emulator connection
./tcpserv

# boot fuzix
#     * edit /etc/netrc set the normal net stuff + mac
#     * edit /etc/resolv.conf for your DNS.
# start 'netd' damon.
# flip to other console, and login, try socktest,dig,telnet,echoping, etc.
