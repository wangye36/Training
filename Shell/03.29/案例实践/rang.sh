#!/bin/bash
time=$(date)   #获取当前时间
times=$(echo $time | awk -F "[ :]" '{print $5":"$6":"$7}') #截取当前小时分钟秒
#echo $times
(while true
do
	secon=$(date | awk -F "[ :]" '{print $7}')		#截取秒
	if [ $secon -gt 10 ];then
		echo -ne "\a"
		sleep 1
	else
		break		
	fi	
done)&
read -p "Do you want to conntinue?[Y\N]" yn
if [ $yn == "Y" -o $yn == "yes" ];then
	echo "OK"
else
	#pvalue=$( ps -aux | grep rang.sh | awk -F " " 'NR==1{print $2}') #截取进程号
	processNum=$(ps aux | grep -w $(basename $0) | grep -v 'grep' | awk -F " " '{print $2}' | sort -r )
	for i in $processNum;do
		kill -9 $i &>/dev/null
	done
	echo "Cancellation successful" 
fi
#	exit 1
#			select i in Persistent Out 
#			do
#				case $i in
#					Persistent)
#						echo "I'm Persistent"
#						break
#						;;
#					Out)
#						echo "I'm Out"
#						kill -9 $pvalue
#						exit 0
#						;;
#				esac
#			done

		#echo -e "\a" #| grep -n '[[:print:]]'

	
