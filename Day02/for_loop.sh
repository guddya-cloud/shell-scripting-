#!/bin/bash

<< task
 1 is argument 
 2 in start range 
 3 is end range 
task

for (( i=$2; i<=$3; i++ ));
do 
	mkdir "$1$i"
done
