#!/bin/bash

#Soal A
export LC_ALL=C
awk '
BEGIN{FS="\t";Max_PP=0}
{if(NR > 1){
PP=($21/($18-$21))*100;
if(PP >= Max_PP)
	{Max_PP=PP;
	MaxID=$1};
}
}
END {printf ("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %d%%.\n",MaxID,Max_PP)}' Laporan-TokoShiSop.tsv > hasil.txt


#Soal B

awk '
BEGIN{FS="\t"}
{if($10~"Albuquerque" && $2~"2017"){
	trav[$7]++}
}
END {printf ("\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:\n")
for (nama in trav) {
	printf("%s\n", nama)}
}' Laporan-TokoShiSop.tsv >> hasil.txt


#Soal C

awk '
BEGIN{FS="\t"}
{if($8~"Home Office" || $8~"Customer" || $8~"Corporate"){
	iter[$8]++}
}
END {
awal=0;
Min_total;
Min_Segmen;
for (segmen in iter) {
	if(awal==0){
		Min_total=iter[segmen];
		Min_Segmen=segmen
		awal++}
	else if(iter[segmen] < Min_total){
		Min_total=iter[segmen];
		Min_Segmen=segmen;}
}
printf ("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan transaksi %d.\n",Min_Segmen,Min_total)}' Laporan-TokoShiSop.tsv >> hasil.txt

#Soal D

awk '
BEGIN{FS="\t"}
{if($13~"West" || $13~"East" ||$13~"South" || $13~"Central"){
	kota[$13]+=$21}
}
END {
min=9999999
for (i in kota){
	if(min > kota[i]){
		min = kota[i];
		region = i;}
	}
printf("\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d.\n",region,min)}' Laporan-TokoShiSop.tsv >> hasil.txt
