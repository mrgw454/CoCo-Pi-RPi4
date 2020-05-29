# select 30 random Dragon 32 cartridges and run them for 60 seconds each

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

shopt -s extglob

for run in {1..30}
do

file=$(shuf -ezn 1 /media/share1/software/dragon_cart/* | xargs -0 -n1 echo)

     clear
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo

     echo "Random cartridge $run"
     echo "file = $file"
     echo
     echo "Press [CTRL][C] to BREAK out of ATTRACT mode."
     sleep 2
     mame dragon32 ${file//+(*\/|.*)} -seconds_to_run 60 $MAMEPARMS

done

cd $HOME/.mame

