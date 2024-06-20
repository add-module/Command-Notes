#!/bin/bash
array=(apple banana cherry date)

for value in "${array[@]}";do
  echo "$value"
done

echo -e  "\n"
 
for index in "${!array[@]}";do
  echo "所有的索引号是：$index  所有的value是：${array[$index]}"
done 
