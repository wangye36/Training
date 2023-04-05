#!/bin/bash
echo "Prints full names and phone numbers for the Savages."

#awk -F " " '(/^Savage/ && NR > 0){print $2}'
awk -F "[ :]" '$2~/Savage/{print $1,$2"\t"$4}' value.txt



echo "-----------------------------------"
echo "Prints Chet s contributions."

awk -F ":" '(/^Chet/ && NR>0){print $3+$4+$5}' /root/3.29/value.txt



echo "-----------------------------------"
echo "Prints all those who contributed $250 the first month."
awk -F ":" '( NR>0 && $3>250){print $0}' value.txt
