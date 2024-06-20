#!/bin/bash
stty erase ^H
read -p "请输入数字：" no_1
if [ -z "$no_1" ] || ! [[ "$no_1" =~ ^([0-9]+)?(\.[0-9]+)?$ ]];then
  echo "无效的符号'$no_1'请输入数字"
  exit 1
else
  read -p "计算符（+、-、*、/）：" vs
fi

case "$vs" in
+|-|\*|/)
  read -p "再输入：" no_2
if [ -z "$no_2" ] || ! [[ "$no_2" =~  ^([0-9]+)?(\.[0-9]+)?$ ]];then
  echo "无效的符号'$no_2'请输入数字"
  exit 1
elif [ "$vs" = "/" ] && [ "$no_2" = 0 ];then
  echo "除数不能为 0"
  exit 1
fi

result=$(echo "scale=3; $no_1  $vs  $no_2" | bc -l)
printf "等于: %.3f\n" $result
  ;;

*)
  echo "无效的计算符 '$vs' "
stty erase ^?
  ;;
esac
