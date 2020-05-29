# loop over Dragon 32 cartridges and run them for 60 seconds each

OIFS="$IFS"
IFS=$'\n'
for file in `find /media/share1/carts-dragon -type f -name "*.rom"`  
do
     clear
     echo "file = $file"
     sleep 2
     xroar -c $HOME/.xroar/xroar.conf -default-machine dragon32 -timeout 60 -cart-autorun "$file"
done
IFS="$OIFS"

cd $HOME/.mame

