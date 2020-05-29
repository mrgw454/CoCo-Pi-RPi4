if [[ $(file --mime-type -b "$1") == text/plain ]]; then

	echo "$1" is ASCII.
	echo -e

	OUTPUT="$(unix2dos -i $1)"

	# capture unix2dos output into a string variable array
	a=( $OUTPUT )


	# check for DOS format (CR/LF's)
	if [ ${a[0]} = "0" ]
	then
		echo -e "No CR/LF's (DOS) detected."
	else
		echo -e "CR/LF's (DOS) detected."
	fi

	# check for UNIX format (LF's only)
	if [ ${a[1]} = "0" ]
	then
		echo -e "No LF's (UNIX) detected."
	else
		echo -e "LF's (UNIX) detected."
		unix2dos $1
	fi

	# check for MAC format (CR's only)
	if [ ${a[2]} = "0" ]
	then
		echo -e "No CR's (MAC) detected."
	else
		echo -e "CR's (MAC) detected."
		mac2unix $1
		unix2dos $1
	fi


else

	echo "$1" is NOT ASCII.  Detokenizing...
	detoken -lo $1.ASCII $1
	cp $1.ASCII $1
	rm $1.ASCII
echo -e

fi

echo -e
echo Done.
echo -e
