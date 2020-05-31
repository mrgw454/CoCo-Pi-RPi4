#!/bin/bash

# script to perform detokenization and/or end of line translation for TRS-80 Color Computer BASIC programs

# get name of script and place it into a variable
scriptname=`basename "$0"`


# get name of current folder and place it into a variable
floppy=`basename "$PWD"`


for f in *; do

  if [[ $f =~ .BAS|.bas ]]; then


	if [[ $(file --mime-type -b "$f") == text/plain ]]; then

		echo "$f" is ASCII.

		OUTPUT="$(unix2dos -i $f)"

	else

		echo "$f" is NOT ASCII.  Detokenizing...
		detoken -lo $f.ASCII $f
		cp $f.ASCII $f
		rm $f.ASCII

	fi


		# capture unix2dos output into a string variable array
		OUTPUT="$(unix2dos -i $f)"
		a=( $OUTPUT )

		# check for DOS format (CR/LF's)
		if [ ${a[0]} = "0" ]
		then
			echo -e "No CR/LF's (DOS) detected."
		else
			echo -e "CR/LF's (DOS) detected."
			dos2unix $f
		fi

		# check for UNIX format (LF's only)
		if [ ${a[1]} = "0" ]
		then
			echo -e "No LF's (UNIX) detected."
			dos2unix $f
		else
			echo -e "LF's (UNIX) detected."
		fi

		# check for MAC format (CR's only)
		if [ ${a[2]} = "0" ]
		then
			echo -e "No CR's (MAC) detected."
		else
			echo -e "CR's (MAC) detected."
			mac2unix $f
		fi

   fi


	# convert to uppercase
	mv $f ${f^^}


	echo -e

done

	echo -e
	echo Done.
	echo -e
