clear

echo
echo
echo
echo
echo
echo
echo
echo

echo "The following HDBDOS versions are available:"
echo
echo NOTE: Turbo Loader versions have *bin* in the filename.
echo
echo COCO-Fastloader Project can be found here:
echo https://github.com/MyTDT-Mysoft/COCO-FastLoader
echo
echo

# set the prompt used by select, replacing "#?"
PS3="
Please select the correct one for your CoCo model:"

# allow the user to choose a file
select filename in /media/share1/HDBDOS/*

do
    # leave the loop if the user says 'stop'
    if [[ "$REPLY" == stop ]]; then break; fi

    # complain if no file was selected, and loop to ask again
    if [[ "$filename" == "" ]]
    then
        echo "'$REPLY' is not a valid number"
        continue
    fi

    # now we can use the selected file
    echo
    echo Make sure to type CLOADM on your CoCo prior to continuing.
    echo
    read -p "Press any key to continue... " -n1 -s
    echo
    echo
    omxplayer -o local "$filename"
    echo
    echo
    echo "$filename" was sent to the RPi analog audio port.
    echo You should be able to type EXEC on the CoCo to start HDBDOS.
    echo
    read -p "Press any key to continue... " -n1 -s
    # it'll ask for another unless we leave the loop
    break
done

cd $HOME/.mame

