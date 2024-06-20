#!/bin/bash
file="mysql.sh"

while read line ;do
  echo "$line"
done< $file 
