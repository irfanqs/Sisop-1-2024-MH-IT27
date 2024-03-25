#!/bin/bash

# CRONJOB
# 0 * * * * aggregate_minutes_to_hourly_log.sh
log_time=$(date +"%Y%m%d%H")

#deklarasi nilai awal
path=~/
mkdir ../log/combined_log

touch ../log/combined_log/combined_metrics.log

for file in ../log/*.log;
do
    awk 'NR==2' "$file" >> "../log/combined_log/combined_metrics.log"
    # cat "$file" >> "../log/combined_log/combined_metrics.log"
done
echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "../log/metrics_agg_${log_time}.log"
# Calculate max
max_mem_tot=$(awk -F',' '{ if ($1 > max_mem_tot || NR == 1) max_mem_tot = $1 } END { print max_mem_tot }' "../log/combined_log/combined_metrics.log")
max_memus=$(awk -F',' '{ if ($2 > max_memus || NR == 1) max_memus = $2 } END { print max_memus }' "../log/combined_log/combined_metrics.log")
max_memfr=$(awk -F',' '{ if ($3 > max_memfr || NR == 1) max_memfr = $3 } END { print max_memfr }' "../log/combined_log/combined_metrics.log")
max_memsh=$(awk -F',' '{ if ($4 > max_memsh || NR == 1) max_memsh = $4 } END { print max_memsh }' "../log/combined_log/combined_metrics.log")
max_membf=$(awk -F',' '{ if ($5 > max_membf || NR == 1) max_membf = $5 } END { print max_membf }' "../log/combined_log/combined_metrics.log")
max_memav=$(awk -F',' '{ if ($6 > max_memav || NR == 1) max_memav = $6 } END { print max_memav }' "../log/combined_log/combined_metrics.log")
max_swaptot=$(awk -F',' '{ if ($7 > max_swaptot || NR == 1) max_swaptot = $7 } END { print max_swaptot }' "../log/combined_log/combined_metrics.log")
max_swapus=$(awk -F',' '{ if ($8 > max_swapus || NR == 1) max_swapus = $8 } END { print max_swapus }' "../log/combined_log/combined_metrics.log")
max_swapfr=$(awk -F',' '{ if ($9 > max_swapfr || NR == 1) max_swapfr = $9 } END { print max_swapfr }' "../log/combined_log/combined_metrics.log")

#get all pathsz and separate alphabet-numeric
pathsz=$(awk -F',' '{print $NF}' "../log/combined_log/combined_metrics.log")
max_pathsz=$(echo "$pathsz" | sed 's/\([0-9]\+\)\([A-Za-z]\+\)/\1 \2/' | sort -nr | head -n 1 | awk '{print $1}')

# Calculate min
min_mem_tot=$(awk -F',' '{ if ($1 < min_mem_tot || NR == 1) min_mem_tot = $1 } END { print min_mem_tot }' "../log/combined_log/combined_metrics.log")
min_memus=$(awk -F',' '{ if ($2 < min_memus || NR == 1) min_memus = $2 } END { print min_memus }' "../log/combined_log/combined_metrics.log")
min_memfr=$(awk -F',' '{ if ($3 < min_memfr || NR == 1) min_memfr = $3 } END { print min_memfr }' "../log/combined_log/combined_metrics.log")
min_memsh=$(awk -F',' '{ if ($4 < min_memsh || NR == 1) min_memsh = $4 } END { print min_memsh }' "../log/combined_log/combined_metrics.log")
min_membf=$(awk -F',' '{ if ($5 < min_membf || NR == 1) min_membf = $5 } END { print min_membf }' "../log/combined_log/combined_metrics.log")
min_memav=$(awk -F',' '{ if ($6 < min_memav || NR == 1) min_memav = $6 } END { print min_memav }' "../log/combined_log/combined_metrics.log")
min_swaptot=$(awk -F',' '{ if ($7 < min_swaptot || NR == 1) min_swaptot = $7 } END { print min_swaptot }' "../log/combined_log/combined_metrics.log")
min_swapus=$(awk -F',' '{ if ($8 < min_swapus || NR == 1) min_swapus = $8 } END { print min_swapus }' "../log/combined_log/combined_metrics.log")
min_swapfr=$(awk -F',' '{ if ($9 < min_swapfr || NR == 1) min_swapfr = $9 } END { print min_swapfr }' "../log/combined_log/combined_metrics.log")
min_pathsz=$(echo "$pathsz" | sed 's/\([0-9]\+\)\([A-Za-z]\+\)/\1 \2/' | sort -n | head -n 1 | awk '{print $1}')

#AVG
avg_mem_tot=$(((max_mem_tot + min_mem_tot) / 2))
avg_memus=$(((max_memus + min_memus) / 2))
avg_memfr=$(((max_memfr + min_memfr) / 2))
avg_memsh=$(((max_memsh + min_memsh) / 2))
avg_membf=$(((max_membf + min_membf) / 2))
avg_memav=$(((max_memav + min_memav) / 2))
avg_swaptot=$(((max_swaptot + min_swaptot) / 2))
avg_swapus=$(((max_swapus + min_swapus) / 2))
avg_swapfr=$(((max_swapfr + min_swapfr) / 2))
avg_pathsz=$(((max_pathsz + min_pathsz) / 2))

#hasil
echo "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "../log/metrics_agg_${log_time}.log"
echo "minimum,$min_mem_tot,$min_memus,$min_memfr,$min_memsh,$min_membf,$min_memav,$min_swaptot,$min_swapus,$min_swapfr,$path,$min_pathsz""M" >> "../log/metrics_agg_${log_time}.log"
echo "maximum,$max_mem_tot,$max_memus,$max_memfr,$max_memsh,$max_membf,$max_memav,$max_swaptot,$max_swapus,$max_swapfr,$path,$max_pathsz""M" >> "../log/metrics_agg_${log_time}.log"
echo "average,$avg_mem_tot,$avg_memus,$avg_memfr,$avg_memsh,$avg_membf,$avg_memav,$avg_swaptot,$avg_swapus,$avg_swapfr,$path,$avg_pathsz""M" >> "../log/metrics_agg_${log_time}.log"

rm -r "../log/combined_log/"

chmod 600 "../log/metrics_agg_${log_time}.log"