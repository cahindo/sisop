# LAPORAN PENJELASAN SOAL SHIFT MODUL 1
## Anggota
- Mohammad Faderik Izzul Haq (05111940000023)
- Jonathan Timothy Siregar (05111940000120)
- Abiya Sabitta Ragadani (05111940000166)
### SOAL 1

### SOAL 2
Pada soal nomer 2 digunakan file Laporan-TokoShiSop.tsv sebagai input dan hasil.txt sebagai output. Setiap awalan menggunakan `BEGIN {FS="\t"}` untuk membaca argumen tiap tab.
##### Sub Soal A
Pada sub soal ini diminta untuk mencari nilai Profit Percentage terbesar dengan Row IDnya. Nilai Profit Percentage didapatkan dari (Profit / Cost) * 100. Dimana cost adalah Sales dikurangi dengan profit sehingga bisa didapatkan rumus PP = (Profit / (Sales - Profit)) * 100. Sehingga jika ditulis didalam awk menjadi `PP=($21/($18-$21))*100` Karena profit adalah argumen ke 21 dan sales adalah argumen ke 18.
Untuk mencari nilai PP terbesar, pertama mendeklarasi nilai `Max_PP` menjadi 0 untuk menyimpan nilai maksimum. Kemudian untuk tiap baris dicari nilai PPnya terlebih dahulu dengan `PP=($21/($18-$21))*100` kemudian dibandingkan dengan nilai `Max_PP` jika lebih besar sama dengan nilai PP maka nilai `Max_PP` akan tergantikan dan akan menyimpan nilai Row IDnya juga dengan `MaxID=$1` karena nilai Row ID adalah argumen pertama.
```Shell
PP=($21/($18-$21))*100
if(PP >= Max_PP){
Max_PP=PP
MaxID=$1}
```
Setelah semua sudah dibandingkan akan mencapai `END` dimana akan print `Transaksi terakhir dengan profit percentage terbesar yaitu MaxID dengan persentase Max_PP%.` dimana nanti akan dimasukan kedalam hasil.txt dengan `Laporan-TokoShiSop.tsv > hasil.txt`
```Shell
END {printf ("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentasi %d%%.\n",Max_PP,MaxID)}' Laporan-TokoShiSop.tsv > hasil.txt
```

##### Sub Soal B
Pada sub soal ini Clemong meminta daftar Customer di Albuquerque pada tahun 2017. Karena itu perlu menyimpan daftar customer tersebut, dimana kita mencari kota Albuquerque dan Tahun 2017. Sehingga digunakan if dengan `if($10~"Albuquerque" && $2~"2017")` disini membandingkan argumen ke 10 dimana membandingkan list kota dengan string "Albuquerque" dan juga membandingkan argumen ke 2 dimana adanya tahun pada order id dengan string "2017" sehingga jika memiliki 2 hal tersebut akan disimpan customer namenya pada array.4
```Shell
if($10~"Albuquerque" && $2~"2017"){
trav[$7]++}
```
Setelah selesai dibandingkan semua akan mencapai  `END` dimana akan print daftar nama menggunakan looping for dengan `for (nama in trav)` yaitu nama yang sudah disimpan pada array dan memasukkannya ke dalam hasil.txt dengan `Laporan-TokoShiSop.tsv >> hasil.txt`. Menggunakan `>>` karena untuk menambahkan hasil sub soal B dibawah jawaban hasil sub soal A.
```Shell
END {printf ("\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:\n")
for (nama in trav) {
	printf("%s\n", nama)}
}' Laporan-TokoShiSop.tsv >> hasil.txt
```

##### Sub Soal C
Untuk soal C, mencari nilai segment customer dengan jumlah transaksi paling sedikit. Karena itu menggunakan if untuk menyimpan tiap segment customer ke dalam array. Segment Customer merupakan argumen ke 8 didalam file.
```Shell
if($8~"Home Office" || $8~"Customer" || $8~"Corporate"){
	iter[$8]++}
```
Kemudian setelah disimpan maka akan dicari nilai transaksi paling sedikitnya dengan menggunakan for. pertama menyimpan salah satu segmen sebagai nilai terkecil kemudian membandingkan tiap segmen dengan nilai minimal tersebut, jika didapatkan lebih kecil maka akan menggantikan nilai minimal tadi.
```Shell
awal=0;
Min_total;
Min_Segmen;
for (segmen in iter) {
	if(awal==0){
		Min_total=iter[segmen];
		Min_Segmen=segmen
		i++}
	else if(iter[segmen] < Min_total){
		Min_order=iter[segmen];
		Min_Segmen=segmen;}
```
Setelah itu akan print hasilnya dengan memasukan hasil ke dalam hasil.txt dengan `Laporan-TokoShiSop.tsv >> hasil.txt`.
```Shell
printf ("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan transaksi %d.\n",Min_Segmen,Min_total)}' Laporan-TokoShiSop.tsv >> hasil.txt
```

##### Sub Soal D
Soal D diminta untuk mencari region yang total keuntungannya paling sedikit. Sehingga sama seperti soal C disimpan terlebih dahulu tiap region ke dalam array untuk tiap regionnya dimana region adalah argumen ke 13 dan menjumlahkan profit di region tersebut.
```Shell
if($13~"West" || $13~"East" ||$13~"South" || $13~"Central"){
	kota[$13]+=$21}
```
Kemudian mendeclare nilai minimal pertama sebagai 9999999 dan membandingkan profit tersebut dengan nilai minimal. Jika nilai tersebut lebih kecil maka akan menggantikan nilai minimal dan juga menyimpan region tersebut di variabel `region`
```Shell
min=9999999
for (i in kota){
	if(min > kota[i]){
		min = kota[i];
		region = i;}
 }
```
Setelah mendapat nilai tersebut dimasukan hasilnya ke dalam hasil.txt dengan menggunakan `Laporan-TokoShiSop.tsv >> hasil.txt`.
```Shell
printf("\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d.\n",region,min)}' Laporan-TokoShiSop.tsv >> hasil.txt
```

### SOAL 3
