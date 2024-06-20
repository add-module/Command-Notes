#!/bin/bash
count=1
sum=0
while [ $count -le 20 ] ;do
  ((sum += count))
  echo "每次的奇数为：$count "
  count=$((count +2))
done
  echo "结果为：$sum"
