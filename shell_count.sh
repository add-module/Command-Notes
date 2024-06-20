#!/bin/bash
# 定义一个关联数组 shell_count
declare -A shell_count

# 循环逐行读取 /etc/passwd 文件中的内容，并将每一行的内容存储在变量 line 中	
while read line 
do
  # echo 循环读取每一行的内容传递给awk过滤到最后一列
  shell_key=$(echo $line |awk -F: '{print $NF}')
  echo "$shell_key"
  sleep 2 
  ((shell_count[$shell_key]++))

done < /etc/passwd

declare -p shell_count
