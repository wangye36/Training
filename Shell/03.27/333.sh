#/bin/bash

rpFile=$1

Usage(){
  cat <<EOF
  Usage:$(basename $0) [File]
EOF
 exit1
}


read -p "请输入需要查找的值:" value
echo "查找到了这些值:"
if [$? =0 ];then
	echo "该值不存在文档内，请重新输入"
else
	echo  "该值为空，请重新输入"
fi
grep -n $value /root/3.27/value.txt | cat 

incise=$(grep -n $value /root/3.27/value.txt |cut -d ":" -f 1)


read -p   "需要替换成什么值:" replacement
i=1
while [ $i -eq 1 ]
do
	if [ $? -eq  0 ]
	then
		select a in "单独替换" "全局替换";do
			case $a in
				单独替换)
					read -p "请选择第几行的值进行替换:" munber
					echo grep -n $value /root/3.27/value.txt | grep -n ^$munber #munber缺少单数双数检测
					grep -n $value /root/3.27/value.txt | grep -n ^$munber | sed -i $munber,$s/$value/$replacement/g 
					break
					;;
				全局替换)
					echo "进行全局替换"
					sed -i 's/$value/$replacement/g /root/3.27/value.txt' | cat -n /root/3.27/value.txt
					break
			esac		
		done
	else
		echo "没有查询到这个值。"
	fi
	let "i+=1"
done

