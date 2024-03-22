#!/bin/bash

cd genshin_character

log() {
    echo "[$(date +'%d/%m/%Y %H:%M:%S')] [$1], [$2]" >> ../../image.log
}

status=false
valid_url='https?://\S+'
genshinFolders=("Fontaine" "Inazuma" "Liyue" "Mondstat" "Sumeru")

while true; do
    for folder in "${genshinFolders[@]}"; do
        cd "$folder" || continue
        for foto in *.jpg; do
            steghide extract -sf "$foto" -p "" > /dev/null 2>&1
            name=$(awk -F '-' '{gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}' <<< "$foto")

            if [ "$status" = true ]; then
                break
            fi

            extract="${name}.txt"

            if [ -f "$extract" ]; then
                # url=$(base64 ${extract})
                # url=${base64 --decode "$extract"}
                # url=$(echo "$extract" | base64 --decode --ignore-garbage)
                url=$(base64 -d <<< echo "$extract")

   
                if [ "$status" = true ]; then
                break
                fi

                if [[ $url =~ $valid_url ]]; then
                    echo "[FOUND] $foto"
                    echo "URL: $url"
                    echo "$url" >> ../../dekripsi.txt
                    log "FOUND" "$foto"
                    wget "$url" -P ../../
                    rm -f "$extract"
                    status=true
                    break
                else
                    echo "[NOT FOUND] $foto"
                    rm -f "$extract"
                    log "NOT FOUND" "$foto"
                fi
            fi
            sleep 1
        done
        cd ..
        sleep 1

        if [ "$status" = true ]; then
                break
        fi
    done
    if [ "$status" = true ]; then
        break
    fi
done
