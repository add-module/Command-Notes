#!/bin/bash
num=0
while [ $num -ge 0 ] && [ $num -le 10 ];do 
num=$((num+1))
if (( $num % 2 == 0  ));then
   echo "$num is even 偶数"
else
   echo "$num is odd 奇数"
fi
done
