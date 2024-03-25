#!/bin/bash

# Download File Sandbox.csv
linkfile="https://drive.google.com/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0"
namafile="Sandbox.csv"
wget -O "$namafile" "$linkfile"

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
output=$(awk -F ',' '$6 == "Adriaens Grayland" {print $2,$18}' Sandbox.csv)
mencarinama=$(awk -F ',' '$6 == "Adriaens Grayland"' Sandbox.csv)
if [ -z "$mencarinama" ]; then
    echo "adriaens tidak terdaftar!!!"
else
    echo "$output"
fi



