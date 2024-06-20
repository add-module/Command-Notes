#!/bin/bash
read -p "请输入一个数字："  stty
stty intr q
echo "请输入："
stty intr ^C
