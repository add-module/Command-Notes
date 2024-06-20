#!/bin/bash
stty erase ^H

main_menu() {
  service=$1
  while true
do 
  select menu in 下载 卸载 启动 停止 状态 返回 退出
  do
    case $menu in
      下载)
         printf "\033[1;32m下载 $service\033[0m\n"
         break
         ;;
      卸载)
         printf "\033[1;31m卸载 $service\033[0m\n"
         break
         ;;
      启动)
         systemctl start $service >/dev/null 2>&1
         if [ $? -eq 0 ];then
           printf  "\033[1;32m$1 已启动\033[0m\n"
         else
           printf "\033[1;31m$1 启动失败\033[0m\n"
         fi
         break
         ;;
      停止)
         systemctl stop $service >/dev/null 2>&1
         if [ $? -eq 0 ];then
           printf "\033[1;32m$1 已停止\033[0m\n"
         else
           printf "\033[1;31m$1 停止失败\033[0m\n"
         fi
         break
         ;;
      状态)
         status=$(systemctl status $service >/dev/null 2>&1 ;echo $?)
         if [ $status -eq 0 ];then
         systemctl status $service |awk '/Active/{printf $0}'
         elif [ $status -eq 3 ];then
           printf  "\033[1;31m$service服务出错、或未启动\033[0m\n"
         elif [ $status -eq 4 ];then
           printf "\033[1;31m没有这样的单元/服务\033[0m\n"
         fi 
         break
         ;;
      返回)
         break 3
         ;;
      退出)
         exit 0
         ;;
      *)
        printf "\033[1;31mUsage:请输入1、2、3、4、5、6、7\033[0m\n"
        break
        ;;
      esac  
  done
done
}

while true
do
  select service in nginx mysql redis Exit
  do
    case $service in
      nginx)
        main_menu $service
        ;;
      mysql)
        main_menu $service
        ;;
      redis)
        main_menu $service
        ;;
      Exit)
        exit 0
        ;;
      *)
        printf "\033[1;31mUsage:请输入1、2、3、4\033[0m\n"
        ;;
    esac
  done
done

stty erase ^?
