#!/bin/bash
mysql_host="172.16.1.51"
databases=$(mysql -h $mysql_host -e 'show databases' | awk 'NR>=3{print $0}')

for db in $databases; do
    if [ ! -d /backup/$db ];then
      mkdir -p /backup/$db
    fi 

    tables=$(mysql -h $mysql_host -e "show tables from $db" |awk 'NR>=2{print $0}')

    for table in $tables;do 
        mysqldump -h $mysql_host --single-transaction $db $table >/backup/$db/"$table"_$(date +%F).sql
    done
done 
