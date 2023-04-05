#!/bin/bash



Help(){
    cat <<EOF
Usage: $(basename "$0") [options] username

Options:
  -a              "add the new user."
  -d              "delete the user."
  -p              "defind password of the user."
  -h              "show help message and exit."
EOF
exit 0
}


if [ $# -eq 0 ];then
	Help
fi

add=0
del=0
passwd=0

#select option in -a -d -p -h ; do
until [ $# -eq 0 ]; do
	case $1 in
		-a)
			add=1
			shift 1
			;;
		-d)
			del=1
			shift 1
			;;
		-p)
			passwd=1
			shift 1
			;;
		-h)	
			Help
			;;
		*)
			userName=$1
			shift 1
	
	esac
done

if [ $add -eq 1 -a $del -eq 1 ];then
	echo "Add user and Delete user can not exist at the same time."
	exit 1
fi

if [ $add -eq 1 -a $del -ne 1 ];then
	if [ ! -z $userName ];then
		grep -w "$userName" /etc/passwd &>/dev/null
		if [ $? -ne 0 ];then
			useradd -m -s /bin/bash $userName
		else
			echo "The user $userName is exist."
			exit 1
		fi
	else
		echo "The username is not exist."
		exit 1
	fi

fi

if [ $passwd -eq 1 -a $del -ne 1 ];then
	if [ ! -z $userName ];then
		passwd $userName
	else
		echo "The username is not exist."
		exit 1
	fi
fi

if [ $del -eq 1 -a $passwd -ne 1 ];then
	if [ ! -z $userName ];then
		grep -w "$userName" /etc/passwd &>/dev/null
		if [ $? -eq 0 ];then
			userdel -rf $userName &>/dev/null
			if [ $? -eq 0 ];then
				echo "Delete the user $userName success."
			fi
		else
			echo "The user $userName is not exist."
		fi
	else
		echo "The username is not exist."
		exit 1
	fi
fi

if [ $del -eq 1 -a $passwd -eq 1 ];then
	echo "if you want to Delete the user, you can't use option '-p'."
	exit 1
fi
