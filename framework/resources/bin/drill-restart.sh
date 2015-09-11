#!/bin/bash

# run the drillTestConfig.properties file as a shell script
# drillTestConfig.properties file should have execute permissions
. src/main/resources/drillTestConfig.properties

function kill_dangling_drillbits(){
IFS=',' read -ra ADDR <<< "$DRILLBITS"
  for i in "${ADDR[@]}"; do
    ssh "root@$i" pkill -9 -f drillbit
  done
}

if rpm -qa | grep -q mapr-drill; then
  DRILLBITS_SPACE=`echo $DRILLBITS | sed 's/,/ /g'`
  maprcli node services -name drill-bits -action stop -nodes $DRILLBITS_SPACE
  kill_dangling_drillbits
  maprcli node services -name drill-bits -action start -nodes $DRILLBITS_SPACE
else
  IFS=',' read -ra ADDR <<< "$DRILLBITS"
  for i in "${ADDR[@]}"; do
    ssh "root@$i" $DRILL_HOME/bin/drillbit.sh stop
    ssh "root@$i" pkill -9 -f drillbit
    ssh "root@$i" $DRILL_HOME/bin/drillbit.sh start
  done
fi

sleep 60
