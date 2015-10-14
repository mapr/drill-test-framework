#!/bin/bash

ls aggregation* |grep -v *.json | while read line
do
	echo $line
	# extract first part of the file name
	filename="${line%.*}"
	name=$(echo ${filename} | sed 's/aggregation_scalar_//')
	#echo $name 
	mv $line $name.out
done
