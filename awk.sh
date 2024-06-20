#!/bin/bash
read -p "请输入要创建用户还是删除用户
1，创建用户
2，创建密码
" input

case "$input" in
1)
for i in $(awk -F: 'NR>=2{print $1}' for_user.sh  );do
  echo "$i"
done
;;

2)
for p in $(awk -F: 'NR>=2{print $2}' for_user.sh  );do
  echo "$p"|passwd --stdin 
done
;;

*)
 echo "只能输入1，或者2"
;;
esac

