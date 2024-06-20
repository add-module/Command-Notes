#!/bin/bash
if ! [[ "$1" =~ ^[a-zA-Z0-9]{6}$ ]] || [[ "$1" =~ [^a-zA-Z0-9] ]];then
  echo "请输入不包含特殊字符的6位数密码"
else
  echo "输入正确"
fi
