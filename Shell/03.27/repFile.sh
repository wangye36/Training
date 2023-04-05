#!/bin/bash

repFile=$1
Usage(){
 cat <<EOF
 Usage:$(basename $0) [File]
EOF

}
if [ -z $repFile ]
then
	Usage
fi
	read -p "Please enter the value you want to replace:" value1
	read -p "Please enter what value you want to replace whit:" value2
#	if [ -z $value1 -o -z $value2 ]
#	then
#		echo "不能为空请重新输入。"
#		continue
	

select i in Single All ;do
	case $i in
		Single)
			single=1
			shift 1
			break
			;;
		All)
			all=1
			shift 1
			break
			;;
	esac
done
echo $single

if [ $single -eq 1 ] 
then
	for a in $(grep -n $value1 $repFile | cut -d ":" -f 1  )
	do
		valuesa=$(sed -n "${1}p" "$repFile")
		echo -n "Do you want to replace the $value1 in line $a whit $value2,"
		read -p "If you want to change,enter[Y\N]:" yn
		if [$yn == "Y" -o $yn == "y" -o $yn == "yes" ]
		then
			sed -i "${1}$,{1}s/$value1/$value2/g" $repFile
			if [ $? -eq ]
			then
				echo "The $value2 replacement was successful."
			else
				echo "Skip the replacement of the $a line."
				continue
			fi
		else
			echo "取消中..."
			break
		fi
	done
else
	sed -i "s/$value1/$value2/g" "$repFile"
	if [ $? -eq 0 ]
	then
		echo "已经将$value2全局替换成功."
	else
		echo "全局替换失败."
	fi

fi
	
				

		

