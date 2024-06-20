#!/bin/bash
random=$(shuf -n 1 -i 00-99)
count=0
stty erase ^H
while true; do
  read -p "请输入00-99数字：" input

  if ! [[ $input =~ ^[0-9]{1,2}$ ]]; then
    printf "\033[1;31m请输入两位数数字\033[0m\n"
    ((count +=1))    

  elif [ $input -gt $random ]; then
    printf "\033[1;35m数字高了，请重新输入\033[0m\n"
    ((count +=1))

  elif [ $input -lt $random ]; then
    printf "\033[1;34m数字低了，请重新输入\033[0m\n" 
    ((count +=1))

  elif [ $input -eq $random ]; then
    printf "\033[1;32m恭喜您，回答正确，您一共用了 $((count + 1)) 次，错了 $count 次\033[0m\n"
    exit 1
  fi
done
stty erase ^?
