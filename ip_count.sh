#!/bin/bash
declare -A ip_count 
awk '{ip_count[$1]++} END {for(key in ip_count) print "key:"key, "value："ip_count[key]}' y-awk-nginx.log
