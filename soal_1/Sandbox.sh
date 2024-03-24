#!/bin/bash

# Download File Sandbox.csv
file_url="https://drive.google.com/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0"
output_file="Sandbox.csv"
wget -O "$output_file" "$file_url"

# Profit Terbesar
awk -F ',' 'NR > 1 {sales[$6]+=$17} END {for (pembeli in sales) print pembeli "," sales[pembeli]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 1 |
awk -F ',' '{print "Nama Pembeli dengan Total Total Sales Tertinggi: " $1}'

# Profit Terkecil
awk -F ',' 'NR > 1 {segment[$6]+=$20} END {profitterkecil=999999999999; segmentterkecil=""; for (cust in segment) {if (segment[cust] < profitterkecil) {profitterkecil=segment[cust]; segmentterkecil=cust}} print "Customer dengan Profit Terkecil: " segmentterkecil}' Sandbox.csv

# Soal 1 C, Menampilkan 3 Kategori profit tertinggi
awk -F ',' 'NR > 1 {kategori[$14]+=$21} END {for (jenis in kategori) print jenis "," kategori[jenis]}' Sandbox.csv |
sort -t ',' -k 2,2nr |
head -n 3

# Soal 1 D, Mencari purchase date dan amount (quantity) dari nama adriaens
mencarinama=$(awk -F ',' '$6 == "adriaens"' datacibe.csv)
if [ -z "$mencarinama" ]; then
    echo "andriaens tidak terdaftar!!!."
else
    echo "$mencarinama"
fi

# Nama Adriaens tidak terdaftar, jadi tidak bisa menampilakn purchase date dan amount (quantitynya)



