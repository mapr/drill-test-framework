#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test register_with_restart.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/register_with_restart.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'register_with_less_drillbits-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/register_with_restart-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/register_with_restart-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'register_with_restart-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

if rpm -qa | grep -q mapr-drill; then
  DRILLBITS_SPACE=`echo $DRILLBITS | sed 's/,/ /g'`
  maprcli node services -name drill-bits -action restart -nodes $DRILLBITS_SPACE >> $LOG_FILE 2>>${LOG_FILE}
else
  for i in "${ADDR[@]}"; do
    ssh "root@$i" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>>${LOG_FILE}
  done
fi
sleep 30

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "select registerwithrestart('Register with ','restart is working') from (values(1));" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'register_with_less_drillbits-1.0.jar';" >> /dev/null 2>>/dev/null

if [[ $QUERY_RESULT == *"Register with restart is working"* ]]; then
  echo "PASS register_with_restart.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL register_with_restart.sh" | tee -a $RESULT_FILE
  echo "FAILED: register_with_restart.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Register with restart is working" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi
