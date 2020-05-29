# select 30 random Coco cartridges and run them for 60 seconds each

for run in {1..30}
do

file=$(shuf -ezn 1 /media/share1/carts/* | xargs -0 -n1 echo)

     clear
     echo "Random cartridge $run"
     echo "file = $file"
     sleep 2
     xroar -c $HOME/.xroar/xroar.conf -default-machine coco2bus -timeout 60 -cart-autorun "$file"

done

cd $HOME/.mame

