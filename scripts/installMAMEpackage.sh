clear

echo
echo
echo
echo
echo
echo
echo
echo

echo "The following MAME packages are available:"
echo

# set the prompt used by select, replacing "#?"
PS3="
Please select package to install or 'stop' to cancel:"

# allow the user to choose a file
select filename in $HOME/packages/mame/*mame*

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
    #sudo dpkg -i --dry-run "$filename"
    sudo dpkg -i "$filename"
    echo
    echo
    read -p "Press any key to continue... " -n1 -s
    # it'll ask for another unless we leave the loop
    break
done

# run the select emulator script to confirm which version of MAME to use as default
select-emu.sh

cd $HOME/.mame

