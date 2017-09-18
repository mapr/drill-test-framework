#!/bin/sh

# The below command causes the shell to exit immediately if any command fails
set -e
mkdir -p /var/drillTestHiveLocks
#
# functions
#
usage()
{
    echo >&2 $1
    cat  << EOF
    $0 <script_name> [ <script_param1>....]
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

parameters="";
for i in $*
do
parameters=$parameters" -hiveconf $i";
done

current_time=$(date "+%Y.%m.%d-%H.%M.%S");
log_loc=$script-$current_time.log;
(
  # Wait for lock on /var/lock/.myscript.exclusivelock (fd 200) for 10 seconds
  flock -x -w 1800 200 || exit 
  hive -f $script_loc $parameters -hiveconf  mapred.map.memory.mb=8096 -hiveconf mapred.map.child.java.opts="-Xmx8000m" -hiveconf  mapreduce.map.memory.mb=8096 -hiveconf mapreduce.map.java.opts="-Xmx8000m" hive.log.file=$log_loc;
) 200>/var/drillTestHiveLocks/.execHive.exclusivelock
exit 0;

