#!/bin/bash
cvalue=$(free -m | grep "Mem" | awk '{print $7}')
dvalue=$( df -h | awk -F " " 'NR >1 {print $5}')
while true
do
	if [ $cvalue -gt 1657 ]
	then
		echo "内存使用率已经超过85%，请合理安排内存。" | mail -s "Memory Warnings" root
	fi
	sleep 1
done

while true
do
	for i in $dvalue
	do
		if [ $i -gt 80 ]
		then
			echo "磁盘存储超过80%，请注意查看。"
			mail -s "Storage exceptions" root
		fi
		sleep 1
	done
done
