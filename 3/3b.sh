#!/bin/bash
kol="Koleksi_"

tanggal=$(date +%d-%m-%Y)

mkdir $tanggal
cd $tanggal

i=1
while [ $i -le 23 ]
do
  if (( i < 10 ))
   then nF="${kol}0${i}"
  elif (( i <= 23 && i >= 10 ))
   then nF="${kol}${i}"
  fi
  
wget -O "$nF" https://loremflickr.com/320/240/kitten -a Foto.log

((i+=1))
done
