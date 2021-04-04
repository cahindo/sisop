#!/bin/bash

PWD="/home/jogar/Documents/praktikum1"

i=1
nF=1
while [ $i -le 23 ]
  do
  
  wget -O "$PWD/$nF.jpg" https://loremflickr.com/320/240/kitten -a "$PWD/Foto.log"

  AWK=($(awk '/https:\/\/loremflickr.com\/cache\/resized\// {print $3}' "$PWD/Foto.log"))

  j=0
  beda=0

  while [ $j -lt $(($i-1)) ]
    do
      if [ "${AWK[j]}" == "${AWK[$(($i-1))]}" ]
	then
          beda=1
      fi

      if [ $beda -eq 1 ]
	then
          rm "$PWD/$nF.jpg"
	  nF=$nF-1
	  break
      fi

  ((j+=1))
  done
	
  if [[ -f "$PWD/$nF.jpg" ]]
    then
      if [ $nF -le 9 ]
	then
	  mv "$PWD/$nF.jpg" "$PWD/Koleksi_0$nF.jpg"
	else
	  mv "$PWD/$nF.jpg" "$PWD/Koleksi_$nF.jpg"

      fi
  fi

  ((i+=1))
  ((nF+=1))
done
