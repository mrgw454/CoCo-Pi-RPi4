clear

echo
echo
echo
echo
echo
echo
echo
echo

echo "The following HDD images are available:"
echo

# set the prompt used by select, replacing "#?"
PS3="
Please select one to use as the default or 'stop' to cancel:"

# allow the user to choose a file
select filename in /media/share1/EMU/VHD/*.img

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
    sudo rm /media/share1/EMU/VHD/HDD.DSK
    sudo ln -s "$filename" /media/share1/EMU/VHD/HDD.DSK
    echo
    echo "$filename" is now the default HDD image.
    echo
    read -p "Press any key to continue... " -n1 -s
    # it'll ask for another unless we leave the loop
    break
done

cd $HOME/.mame

