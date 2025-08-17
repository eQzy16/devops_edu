#!/bin/bash

cur_date=$(date -u +%Y-%m-%d)
log_date=$(date -u "+%Y-%m-%d %H:%M:%S")
dir="$HOME/linux_p2"

mkdir -p "$dir/log" "$dir/old_backup"

find "$dir" -maxdepth 1 -name "*.tar.gz" -mmin +3 -print0 | while IFS= read -r -d '' f; do
    mv "$f" "$dir/old_backup/"
    echo "$log_date - Moved $f to $dir/old_backup/" | tee -a "$dir/log/backup.log"
done

for i in "$dir"/*.txt; do
    [ -e "$i" ] || continue
    echo "$log_date - Archiving $i" | tee -a "$dir/log/backup.log"
    tar -czf "${i}_${cur_date}.tar.gz" "$i" 2>> "$dir/log/err_backup.log"
done
