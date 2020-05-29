# Play one of Sockmaster's Donkey Kong Hacks

MAMEPARMSFILE=`cat $HOME/.mame/.optional_mame_parameters.txt`
export MAMEPARMS=$MAMEPARMSFILE

     clear
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo
     echo "Press [ESC] to EXIT game."
     sleep 2
     mame dkongx11 $MAMEPARMS

cd $HOME/.mame
