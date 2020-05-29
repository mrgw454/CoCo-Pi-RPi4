# loop over Coco cartridges and run them for 60 seconds each

OIFS="$IFS"
IFS=$'\n'
for file in `find /media/share1/carts -type f -name "*.ccc"`  
do
     clear
     echo "file = $file"
     sleep 2
     xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -timeout 60 -cart-autorun "$file"
done
IFS="$OIFS"

cd $HOME/.mame

