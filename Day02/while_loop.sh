#!/bin/bash

<< task
num=0 

while [[ $num -le 20 ]]
do 
	echo $num
	num=$((num+2))
done 

task

num=1

while [ $num -le 20 ]
do
	if [ $((num % 2)) -eq 0 ]
	then 
		echo "$num is even"
	fi

	num=$((num + 1))
done
