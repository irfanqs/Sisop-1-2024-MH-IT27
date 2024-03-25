#!/bin/bash

#CRONJOB
#* * * * * minute_log.sh

# Mengatur waktu untuk nama file log
log_time=$(date +"%Y%m%d%H%M%S")
log_file="/home/irfanqs/log/metrics_$log_time.log"

# Mengambil metrics RAM dan metrics swap
ram_metrics=$(free -m | awk 'NR==2 {print $2","$3","$4","$5","$6","$7}')
swap_metrics=$(free -m | awk 'NR==3{print $2","$3","$4}')

# Mengambil metrics size direktori target
target_path="/home/irfanqs/"
dir_size=$(du -sh "$target_path" | awk '{print $1}')

# Menulis metrics ke dalam file log
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "$log_file"
echo "$ram_metrics,$swap_metrics,$target_path,$dir_size" >> "$log_file"

# Mengubah izin folder log
chmod 600 $log_file

