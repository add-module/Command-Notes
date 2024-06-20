#!/bin/bash
read -p "请输入账号：" account_name
read -sp "请输入密码：" account_password
useradd ${account_name} 
echo "${account_password}" |passwd --stdin ${account_name} >/dev/null 

if  [ ! -f /tmp/user_info.log ] ;then
  touch /tmp/user_info.log 
fi
echo  "${account_name}:${account_password}" >>/tmp/user_info.log
