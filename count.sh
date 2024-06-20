#!/bin/bash
count=0
while [ "$p" != "abc" ]; do
  if [ $count -eq 3 ];then
    exit 1
  fi
  read -p "请输入数据：" p
  ((count++))
done
