#!/bin/bash
read -p "请输入外网ip地址：" main_ip
read -p "请输入内网ip地址：" deputy_ip
read -p "请输入主机名："  host_name

# 修改外网ip地址
net_ip=$(sed -rn 's/IPADDR=(.*)/\1/Ip' /etc/sysconfig/network-scripts/ifcfg-eth0)
sed -i "s/IPADDR=$net_ip/IPADDR=$main_ip/" /etc/sysconfig/network-scripts/ifcfg-eth0

# 修改内网ip地址
net_ip2=$(sed -rn 's/IPADDR=(.*)/\1/Ip' /etc/sysconfig/network-scripts/ifcfg-eth1)
sed -i "s/IPADDR=$net_ip2/IPADDR=$deputy_ip/" /etc/sysconfig/network-scripts/ifcfg-eth1

# 修改主机名
hostnamectl set-hostname $host_name
