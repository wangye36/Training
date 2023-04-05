#!/bin/bash
#File=$1
#Usage(){
#	cat << EOF
#	Usage:$(basename $0) [File]
#EOF
#}
echo "alias del='mv -t /root/recycle/'" >>/root/.bash
#find $pwd !(*.bak) -mtime +30 -exec rm -rf {} \; | ls
date -s "2023-05-29 10:58:00"
#find ~/recycle/* -mtime +30 -print -exec rm -rf {} 
find ~/recycle/* -mtime +30 -exec rm -rf {} \;
date -s "2023-03-30 16:06:00"
