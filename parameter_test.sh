#!/bin/bash
# 有引号效果
echo "\$* 所有的参数是：$*"
for i in "$*";do 
echo $i
done

echo "\$@ 所有的参数是：$@"
for ai in "$@";do 
echo $ai
done


echo '==========================================================================================='

# 无引号效果
echo "\$* 所有的参数是：$*"
for i in $*;do
echo $i
done

echo "\$@ 所有的参数是：$@"
for ai in $@;do
echo $ai
done
