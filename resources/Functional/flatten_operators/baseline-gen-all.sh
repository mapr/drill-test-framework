#!/bin/bash

for file in drill-output/*
do 
  IFS='_' read -ra ADDR <<< "$file"
  for i in "${ADDR[@]}"; do
    if [[ "$i" == *output ]]
    then
        IFS='.' read -ra vals <<< "$i"
         output_file="join/hash-join/${vals[0]}.e_tsv"
         echo "" > $output_file
         for i in $(seq 1)
         do
           #cat $file >> $output_file
           cp -f $file $output_file
           echo $i
         done
    fi
  done
done
