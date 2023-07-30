#!/bin/bash
if [ -z $1 ]
then
	VAR1=1
else
	VAR1=$1
fi
clear
printf "U"
while true
do
	sleep $VAR1
	printf "wU"
done
