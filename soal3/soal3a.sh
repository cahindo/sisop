#!/bin/bash

i=1
nF=1
while [ $i -le 23 ]
  do
  
  wget -O "$nF.jpg" https://loremflickr.com/320/240/kitten -a Foto.log

  AWK=($(awk '/https:\/\/loremflickr.com\/cache\/resized\// {print $3}' ./Foto.log))

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
          rm "$nF.jpg"
	  nF=$nF-1
	  break
      fi

  ((j+=1))
  done
	
  if [[ -f "$nF.jpg" ]]
    then
      if [ $nF -le 9 ]
	then
	  mv "$nF.jpg" "Koleksi_0$nF.jpg"
	else
	  mv "$nF.jpg" "Koleksi_$nF.jpg"

      fi
  fi

  ((i+=1))
  ((nF+=1))
done
