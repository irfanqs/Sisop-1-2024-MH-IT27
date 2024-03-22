#!/bin/bash

wget -O genshin.zip "https://drive.usercontent.google.com/u/0/uc?id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN&export=download"

unzip *.zip

unzip genshin_character.zip

cd genshin_character

for encode in *.jpg;
do
 name=$(basename "$encode" .jpg)
 decode=$(echo "$name" | xxd -r -p)
 mv "$encode" "${decode}.jpg"
done

cd ..
mv list_character.csv genshin_character
cd genshin_character

for char in *.jpg;
do
 namaFoto=$(basename "$char" .jpg)
 region=$(awk -F ',' "/$namaFoto/ {print \$2}" list_character.csv)
 element=$(awk -F ',' "/$namaFoto/ {print \$3}" list_character.csv)
 senjata=$(awk -F ',' "/$namaFoto/ {print \$4}" list_character.csv)

 gantiNama="${region} - ${namaFoto} - ${element} - ${senjata}" 
 
 mkdir -p "${region}"

 gantiNama=$(echo "$gantiNama" | tr -d '\r')

 mv "$char" "${region}/${gantiNama}.jpg"

done

awk -F ',' 'NR > 1 {
    gsub(/\r/, "", $4)
    senjata[$4]++
} 
END {
    for (weapon in senjata) {
        if (weapon != "") {
            printf "%s : %d\n", weapon, senjata[weapon]
        }
    }
}' list_character.csv

cd ..

rm -r genshin.zip genshin_character/list_character.csv genshin_character.zip


