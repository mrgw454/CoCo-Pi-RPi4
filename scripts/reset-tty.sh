echo -e "Current tty1 (local console) processes:"
ps auwx | grep tty1
echo -e ""
echo -e "Resetting tty1 (local console)..."
echo -e ""
sudo kill $(ps auwx | grep 'tty1' | awk '{print $2}')
echo -e ""
echo -e "Current tty1 (local console) processes:"
echo -e ""
ps auwx | grep tty1
echo -e ""
echo -e "done!"
echo -e ""
