#!/bin/sh

#
# functions
#
usage()
{
    echo >&2 $1
    cat  << EOF
    $0 <script_name> 
EOF
    exit 1
}


##
## MAIN
##
if [ $# = 0 ]; then
    usage "No arguements given"
fi

script=$1;
script_loc=$script;
echo $script_loc;
echo "Executing the $script_loc script";
shift;
cat $script_loc | hbase shell
exit 0;
 
