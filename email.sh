#!/bin/bash
read -p "请输入：" email
case $email in
  *@[a-z]?.com)
    echo "合法的邮箱地址"
    ;;
  *)
    echo "非法的邮箱地址"
    ;;
esac
