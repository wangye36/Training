#!/bin/bash
read -p  "please input a username:" USER
i=1
while [ $i -lt 3 ]
do
if id -u $USER >/dev/null 2>&1 
then
	echo "$USER 存在"
	break
else
	echo "$USER 不存在"
	read -p  "please input a username:" USER
fi
let "i+=1"

done
if [ $i -eq 3 ]
then
	echo "输入错误超过三次,自动退出"
fi

exit 0 
