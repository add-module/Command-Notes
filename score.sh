#!/bin/bash
read -p "请输入成绩得分：" score1
if ! [[ "$score1" =~ ^[0-9][0-9]?$|^100$ ]];then
  echo "error：'$score1' 请输入0-100纯数字"
  exit 1
fi

if [ "$score1" -le 59 ];then
  echo "成绩不合格"
elif [ "$score1" -ge 60 ] && [ "$score1" -le 85 ];then
  echo "成绩良好"
elif [ "$score1" -ge 86 ] && [ "$score1" -le 100 ];then
  echo "成绩优秀"
fi
