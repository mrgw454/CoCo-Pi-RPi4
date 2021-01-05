clear

echo
echo
echo
echo
echo
echo
echo
echo

echo "The following XRoar packages are available:"
echo

# set the prompt used by select, replacing "#?"
PS3="
Please select package to install or 'stop' to cancel:"

# allow the user to choose a file
select filename in $HOME/packages/xroar/*xroar*

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
    sudo dpkg -i --dry-run "$filename"
    echo
    echo
    read -p "Press any key to continue... " -n1 -s
    # it'll ask for another unless we leave the loop
    break
done

# run the select emulator script to confirm which version of XRoar to use as default
select-xroar.sh

cd $HOME/.mame

