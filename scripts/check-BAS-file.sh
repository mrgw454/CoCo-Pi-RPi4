#!/bin/bash

# script to perform detokenization and/or end of line translation for TRS-80 Color Computer BASIC programs


  if [[ $1 =~ .BAS|.bas ]]; then


	if [[ $(file --mime-type -b "$1") == text/plain ]]; then

		echo "$1" is ASCII.

		OUTPUT="$(unix2dos -i $1)"

	else

		echo "$1" is NOT ASCII.  Detokenizing...
		detoken -lo $1.ASCII $1
		cp $1.ASCII $1
		rm $1.ASCII

	fi


		# capture unix2dos output into a string variable array
		OUTPUT="$(unix2dos -i $1)"
		a=( $OUTPUT )

		# check for DOS format (CR/LF's)
		if [ ${a[0]} = "0" ]
		then
			echo -e "No CR/LF's (DOS) detected."
		else
			echo -e "CR/LF's (DOS) detected."
			dos2unix $1
		fi

		# check for UNIX format (LF's only)
		if [ ${a[1]} = "0" ]
		then
			echo -e "No LF's (UNIX) detected."
			dos2unix $1
		else
			echo -e "LF's (UNIX) detected."
		fi

		# check for MAC format (CR's only)
		if [ ${a[2]} = "0" ]
		then
			echo -e "No CR's (MAC) detected."
		else
			echo -e "CR's (MAC) detected."
			mac2unix $1
		fi

   fi

	echo -e

	# convert to uppercase
	mv $f ${f^^}

	echo -e
	echo Done.
	echo -e
