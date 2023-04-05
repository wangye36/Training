#!/bin/bash
list=$(cat /root/3.25/username.txt)
[ -e /root/3.25/userlist.txt ] && rm -rf /root/3.25/userlist.txt 
for i in $list
do
	userdel -rf $i
	useradd $i
#	echo $i
#	n='mkpasswd -l 10 -s 0'
	n=$(openssl rand -base64 5)
	
	echo $i:$n | chpasswd
	echo $i      $n >> /root/3.25/userlist.txt
#	[ $? -eq 0 ] && echo "$list创建成功"
done
