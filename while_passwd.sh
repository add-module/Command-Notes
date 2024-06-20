#!/bin/bash
file=$(awk -F ":" '$NF ~ /nologin/' /etc/passwd)

while read line ;do
  if [ -n "$file" ];then
  echo "$line"
  sleep 3
  fi
done < "$file"
