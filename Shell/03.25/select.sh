#!/bin/bash
select i in zhangsan lisi wangwu ;do
	case $i in 
		zhangsan)
			echo "I am zhangsan"
			;;
		lisi)
			echo "I am lisi"
			;;
		wangwu)
			echo "I am wangwu"
			;;

	esac
done


select i in pwd ls ;do
	 $i
 done
