#!/bin/bash

# make sure to download the cartridge files from colorcomputerarchive.com before using
# wget -v --mirror -p --convert-links --no-parent http://www.colorcomputerarchive.com/coco/Cartridges/

# ROM trailer/footer info to convert them to a BIN:
# 2K		00 08 00 40 00						FF 00 00 40 00
# 4K		00 10 00 40 00						FF 00 00 40 00
# 8K		00 20 00 40 00						FF 00 00 40 00
# 12K		00 30 00 40 00						FF 00 00 40 00
# 16K		00 40 00 40 00						FF 00 00 40 00


# find all ccc (cartridge files) and process them

shopt -s nocaseglob
shopt -s globstar
shopt -s nocasematch

counter=1

for i in $PWD/$1/**/*.ccc; do # Whitespace-safe and recursive

		fullfilename="$i"
		filename=$(basename "$fullfilename")
    fname="${filename%.*}"
    filesize=$(stat -c%s "$fullfilename")
		cartsize=$(numfmt --to=iec $filesize)

    # extract RS catalog number from cartridge filename description
    catnum=$(echo "$i" | grep -o -P '26-.{0,4}')

    # extract parent folder name from full path
    filepath=$i
    parentname="$(basename "$(dirname "$filepath")")"


# check for non-original versions of cartridges and exclude them
if [[ $fullfilename != *"[a1]"* ]] && [[ $fullfilename != *"[b1]"* ]] && [[ $fullfilename != *"[o1]"* ]] && [[ $fullfilename != *"[h1]"* ]] && [[ $fullfilename != *"26-xxxx"* ]]; then

		# if RS catalog number for catridge is not blank, process the file
		if [ ! -z "$catnum" ]; then


		echo Processing "$filename - $filesize - $cartsize - $catnum"


      # create folder based on ROM size (in K)
			if [ ! -d "$cartsize" ]; then
					mkdir "$cartsize"
			fi


      if [ ! -d "$cartsize/$catnum" ]; then
					mkdir "$cartsize/$catnum"
			fi


      # if the destination DSK image does not exist, create it
			if [ ! -f "$cartsize/$catnum/$catnum.DSK" ]; then
          decb dskini "$cartsize/$catnum/$catnum.DSK" -n"$fname"
			fi

          # add Barry's ROM to BIN conversion programs to DSK image
          #decb copy -2 -b -r "$i" "$cartsize/$catnum/$catnum.DSK","${catnum^^}.ROM"
          #decb copy -0 -a -r "PRGFLASH/CONV2BIN.BAS" "$cartsize/$catnum/$catnum.DSK","CONV2BIN.BAS"
          #decb copy -2 -b -r "PRGFLASH/CONV2BIN.BIN" "$cartsize/$catnum/$catnum.DSK","CONV2BIN.BIN"
          decb copy -0 -a -r "PRGFLASH/PRGFLASH.BAS" "$cartsize/$catnum/$catnum.DSK","PRGFLASH.BAS"
          decb copy -2 -b -r "PRGFLASH/PRGFLASH.BIN" "$cartsize/$catnum/$catnum.DSK","PRGFLASH.BIN"
          decb copy -0 -a -r "PRGFLASH/MENU.BAS" "$cartsize/$catnum/$catnum.DSK","MENU.BAS"
          decb copy -2 -b -r "PRGFLASH/BASLOAD.BIN" "$cartsize/$catnum/$catnum.DSK","BASLOAD.BIN"
          
          cp "$i" "$cartsize/$catnum/$catnum.ROM"


          # if cartridge is 2K...
          if [ $filesize -eq 2048 ]; then

 
             # add header/footer to ROM file to convert to a BIN (2K)
             for c in $cartsize/$catnum/$catnum.ROM; do
            
            	printf "\x00\x08\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
						done
					
					fi


        	# if cartridge is 4K...
          if [ $filesize -eq 4096 ]; then

 
             # add header/footer to ROM file to convert to a BIN (4K)
             for c in $cartsize/$catnum/$catnum.ROM; do
            
            	printf "\x00\x10\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
						done
						
					fi


       		# if cartridge is 8K...
          if [ $filesize -eq 8192 ]; then

 
             # add header/footer to ROM file to convert to a BIN (8K)
             for c in $cartsize/$catnum/$catnum.ROM; do
            
            	printf "\x00\x20\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
							done
							
					fi


     			# if cartridge is 12K...
          if [ $filesize -eq 12288 ]; then

 
             # add header/footer to ROM file to convert to a BIN (12K)
             for c in $cartsize/$catnum/$catnum.ROM; do
            
            	printf "\x00\x30\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
							done
							
					fi


    			# if cartridge is 16K...
          if [ $filesize -eq 16384 ]; then

 
             # add header/footer to ROM file to convert to a BIN (16K)
             for c in $cartsize/$catnum/$catnum.ROM; do
            
            	printf "\x00\x40\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
						done
						
					fi


          # if cartridge is over 16K...
          if [ $filesize -gt 16384 ]; then

            # split ROM files over 16K in size
            /usr/bin/split -b 16384 -d "$i" "$cartsize/$catnum/$catnum."
          	
             # add header/footer to ROM file to convert to a BIN (16K)
             for c in $cartsize/$catnum/$catnum.0*; do
            
            	printf "\x00\x40\x00\x40\x00" | cat - $c > $c.BIN
            	printf "\xFF\x00\x00\x40\x00" >> $c.BIN
              rm $c
              mv $c.BIN $c
              
              binname=$(basename "$c")
              decb copy -2 -b -r "$c" "$cartsize/$catnum/$catnum.DSK","$binname"  
						
						done

         	 # add SPLIT program to DSK image, too
           #decb copy -0 -a -r "PRGFLASH/SPLIT.BAS" "$cartsize/$catnum/$catnum.DSK","SPLIT.BAS"



          fi

          # generate quick report of files (compatible with DW2HD.BAS)
    			echo $counter,\""$fullfilename\"",\""$parentname\"",\""$filename\"",\""$fname\"",$filesize | grep -E '.CCC|.ccc' >> $1.TXT
    			#echo $counter,\""$fullfilename\"",\""$parentname\"",\""$filename\"",\""$fname\"",$filesize | grep -E '.CCC|.ccc'
					counter=$((counter+1))

		fi

fi


done

echo -e
unix2dos $1*.TXT
echo -e

shopt -u nocaseglob
shopt -u globstar
shopt -u nocasematch

echo Done!
