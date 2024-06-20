#!/bin/bash
custom_repo=/etc/yum.repos.d/custom_repo
read -p "请输入要下载的软件名：" program

  yum list $program 

if [ $? -eq 0  ];then
  yum --disablerepo=custom install --downloadonly --downloaddir=$custom_repo $program  
  createrepo $custom_repo
  read -r -p "是否需要应用： y / n  " y_n
   
  if [ $y_n = y ];then
    yum install $program -y 
  else
    exit
  fi
fi
