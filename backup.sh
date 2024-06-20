#!/bin/bash
if [ ! -d /backup ];then
  mkdir /backup
elif [ ! -f /backup/$(date '+%F').tar.xz ];then
  cd /opt/script
  tar -Jcf /backup/$(date '+%F').tar.xz    .
else
  echo "文件已存在"
fi
find /backup -type f -name "*.tar.xz" -mtime +7 -delete
