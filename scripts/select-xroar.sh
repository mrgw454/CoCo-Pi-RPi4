clear

echo
echo
echo
echo
echo
echo
echo
echo

echo "The following emulator versions are available:"
echo

# set the prompt used by select, replacing "#?"
PS3="
Please select one to use as the default or 'stop' to cancel:"

# allow the user to choose a file
select filename in /usr/local/bin/*xroar-*

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
    sudo rm /usr/local/bin/xroar
    sudo ln -s "$filename" /usr/local/bin/xroar
    echo 
    echo "$filename" is now the default emulator.
    echo
    read -p "Press any key to continue... " -n1 -s
    # it'll ask for another unless we leave the loop
    break
done

cd $HOME/.mame

