#!/bin/bash

#1


#for i in {001..100};do
#	id -u user$i |echo $?> /dev/null
#	if [ $? == 0 ];then
#		userdel -r user$i 2> /dev/null	
#	fi
#		useradd user$i
#		echo "user$i:123456" | chpasswd
#done






#2
#cat username.txt | xargs -I {} userdel {} 2>/dev/null
#cat username.txt | xargs -I {} useradd {}
#passwd=$(cat passwd.txt | xargs -I {} mkpasswd -5 {})
#echo $passwd | while read line; do
#	echo $line
#	sleep 1
#done
#cat username.txt | xargs -I {} echo "{}:cat passwd.txt | xargs -I {} mkpasswd -5 {}"|chpasswd
#cat username.txt | xargs -I {} echo "{}:{}"|chpasswd
#cat username.txt | xargs -I {} echo "{}"

user=$(cat /root/username.txt)   #设置usernmae.txt文档内容为变量$user

cat /root/username.txt | xargs -I {} id -u {} 2&>/dev/null && echo $? 2&>/dev/null   #查看是否存在文档中的用户

if [ $? == 0 ];then        #如果返回值为0，就是表示有用户存在
	cat username.txt | xargs -I {} userdel -r {} 2>/dev/null     #有用户存在的话将用户删除
fi

[ -e /root/list.txt ] && rm -rf /root/list.txt     #查看是否有list.txt文档存在，如果存在就将文档删除

cat username.txt | xargs -I {} useradd {}    #用xargs将文档中的内容引用到创建用户

for i in $user    #利用for循环使用username.txt中的内容
do
	ls /home | grep $i 2&>/dev/null      #查看是否存在用户的家目录

	echo $?  >/dev/null       

       	if [ $? == 0 ];then       
		rm -rf /home/$i     #如果存在家目录将家目录删除
	fi

	passwd=$(openssl rand -base64 5)      #将随机字符串设置为变量passwd

	echo $i:$passwd | chpasswd            #利用随机字符串给用户设置密码

	echo $i   $passwd >> /root/list.txt    #将用户名和对应的密码输入到list.txt中

	chage -d 0 $i      #设置用户密码过期时间   0   相当于马上过期，这样就可以实现第一次登录需要修改密码

	mkdir /home/$i       #创建用户的家目录

done














						 #3
#i=1
#while (($i <= 3));
#do
#	read -p "user:" username
#	if [ $username == 'admin' ];then
#		read -sp "password:" password
#		if [ $password == 'Skills39' ];then
#			echo -e "\nLogin successful"
#			break
#		fi
#	else
#		let i+=1
#	fi
#done
