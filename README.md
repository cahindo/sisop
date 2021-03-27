# LAPORAN PENJELASAN SOAL SHIFT MODUL 1

### SOAL 1

### SOAL 2
Pada soal nomer 2 digunakan file Laporan-TokoShiSop.tsv sebagai input dan hasil.txt sebagai output. Setiap awalan menggunakan `BEGIN {FS="\t"}` untuk membaca argumen tiap tab.
##### Sub Soal A
Pada sub soal ini diminta untuk mencari nilai Profit Percentage terbesar dengan Row IDnya. Nilai Profit Percentage didapatkan dari (Profit / Cost) * 100. Dimana cost adalah Sales dikurangi dengan profit sehingga bisa didapatkan rumus PP = (Profit / (Sales - Profit)) * 100. Sehingga jika ditulis didalam awk menjadi `PP=($21/($18-$21))*100` Karena profit adalah argumen ke 21 dan sales adalah argumen ke 18.
Untuk mencari nilai PP terbesar, pertama mendeklarasi nilai `Max_PP` menjadi 0 untuk menyimpan nilai maksimum. Kemudian untuk tiap baris dicari nilai PPnya terlebih dahulu dengan `PP=($21/($18-$21))*100` kemudian dibandingkan dengan nilai `Max_PP` jika lebih besar nilai PP maka nilai `Max_PP` akan tergantikan dan akan menyimpan nilai Row IDnya juga dengan `MaxID=$1` karena nilai Row ID adalah argumen pertama.
Setelah semua sudah dibandingkan akan mencapai `END` dimana akan print `Transaksi terakhir dengan profit percentage terbesar yaitu MaxID dengan persentase Max_PP%.` dimana nanti akan dimasukan kedalam hasil.txt dengan `Laporan-TokoShiSop.tsv > hasil.txt`

##### Sub Soal B
### SOAL 3
