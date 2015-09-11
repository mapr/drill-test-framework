#!/bin/bash

# This script deletes all hbase tables in a very UGLY way
# It checks for "list TABLE" from the output of hbase "list"
# command and then takes the following values for table names
# ignoring the last 5 strings

hbase_list_output=$(echo "list" | hbase shell)
hbase_list_output_no_newline=$(echo $hbase_list_output | tr '\n' ' ' )

IFS=' '
ary=($hbase_list_output_no_newline)
arySize=${#ary[@]}
tableCommands=();
index=0
for key in "${!ary[@]}"; do 
    if [[ $key -eq 0 ]] ; then 
        continue
    fi
    var_prev=${ary[$key-1]}
    var_cur=${ary[$key]}
    if [ "$start" = "start" -a $key -le $(($arySize-6)) ]; then
        tableCommands+=("disable '$var_cur'")
        tableCommands+=("drop '$var_cur'")
        continue
    fi
    
    if [ "$var_cur" = "TABLE" -a "$var_prev" = "list" ]; then
        start="start";
    fi
done
output=$(printf -- '%s\n' "${tableCommands[@]}" | hbase shell)
echo $output
