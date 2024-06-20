#!/bin/bash

main_menu() {
  local service=$1
  while true; do
    select menu in 下载 卸载 启动 停止 状态 返回; do
      case $menu in
        下载)
          echo "下载 $service"
          ;;
        卸载)
          echo "卸载 $service"
          ;;
        启动)
          systemctl start $service
          ;;
        停止)
          systemctl stop $service
          if [ $? -eq 0 ]; then
            echo "$service 已停止"
          else
            echo "$service 停止失败"
          fi
          ;;
        状态)
          systemctl status $service
          ;;
        返回)
          break 2
          ;;
        *)
          echo "Usage:请输入1、2、3、4、5、6"
          ;;
      esac
    done
  done
}

while true; do
  select service in nginx mysql redis Exit; do
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
        exit
        ;;
      *)
        echo "Usage:请输入1、2、3、4"
        ;;
    esac
  done
done

