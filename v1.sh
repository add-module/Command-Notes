#!/bin/bash
user_name="a63153392"
user_passwd="7898632"
count=0
user_count=0

while true
do
  read -p $'请输入账号：\n' login
    if [ "$login" != "$user_name" ];then
      printf "\033[1;31m该账号不存在\033[0m\n"
      ((user_count++))
    if ((user_count > 7));then
      printf "\033[1;31m超过最大限制请休息10秒\033[0m\n"
      sleep 10s
      user_count=0
    fi
 
    else
      while true
      do
        read -s -p $'请输入密码：\n' login_passwd
          if [ "$login_passwd" != "$user_passwd" ];then
            printf "\033[1;31m密码错误\033[0m\n"
            ((count++))  
          else
            printf "\033[1;32m登录正确，循环结束请开始happy吧！\033[0m\n"
            exit 0
          fi
          if ((count > 3));then
            printf "\033[1;31m密码输入超过$count次\033[0m\n"
            count=0         
            break  
          fi
      done
    fi
done
