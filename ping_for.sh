#!/bin/bash
#subnet="172.16.1."
#
#for p in $(seq 1 30);do
#  if  ping -c 1 -w 1 $subnet$p  >/dev/null 2>&1 ;then
#    printf  "\033[1;32m%-15s\033[0m\n" "存活的机器是: $subnet$p" 
#  else
#    printf  "\033[31m%-15s\033[0m\n" "不存活的机器是：$subnet$p" 
#  fi
#done

#!/bin/bash
subnet="172.16.1."
for i in {1..30}; do
  ping -c 1 -w 1 $subnet$i >/dev/null 2>&1 &
done

wait

#echo "存活的主机为："
#for i in {1..30}; do
#  if ping -c 1 -w 1 $subnet$i >/dev/null 2>&1; then
#    echo "$subnet$i"
#  fi
#done
