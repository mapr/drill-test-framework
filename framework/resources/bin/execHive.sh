#!/bin/sh

# The below command causes the shell to exit immediately if any command fails
set -e
mkdir -p /var/drillTestHiveLocks
LOCKFILE="/var/drillTestHiveLocks/hivelock"
LOCKFD=99

# PRIVATE
_lock()             { flock -$1 $LOCKFD; }
_no_more_locking()  { _lock u; _lock xn && rm -f $LOCKFILE; }
_prepare_locking()  { eval "exec $LOCKFD>\"$LOCKFILE\""; trap _no_more_locking EXIT; }

# ON START
_prepare_locking

exlock()            { _lock x; }   # obtain an exclusive lock
unlock()            { _lock u; }   # drop a lock

# first obtain an exclusive lock
exlock

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
hive -f $script_loc $parameters hive.log.file=$log_loc;
exit 0;

