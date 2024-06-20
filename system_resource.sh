#!/bin/bash
mem_free=$(free | awk 'NR==2 {print $3/$2 * 100}')
disk_df=$(df | awk '/\/$/ {print $3/$2 * 100}')
cpu_mpstat=$(mpstat | awk 'END{print 100 - $NF}')

if (( $(echo "$mem_free > 85" |bc -l) ));then
free | awk 'NR==2 {printf "当前 '$(date '+%m月%d日')' '$(date '+%T')' '$(date +周%w)' 内存使用率为：%.2f%\n", $3 / $2 *100}' >> /backup/free.txt
fi

if  (( $(echo "$disk_df > 85" | bc -l) ));then
df |awk '/\/$/{printf "当前 '$(date '+%m月%d日')' '$(date '+%T')' '$(date +周%w)' 磁盘使用率为：%.2f%\n" ,$3 / $2 * 100}' >> /backup/df.txt
fi

if (( $(echo "$cpu_mpstat > 85" |bc -l) ));then
mpstat | awk 'END{printf "当前 '$(date '+%m月%d日')' '$(date '+%T')' '$(date +周%w)' cpu使用率为：%.2f%\n", 100 - $NF}' >> /backup/mpstat.txt
fi
