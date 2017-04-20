#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test register_in_past.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/register_in_past.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

if [ $numDrills -lt 2 ]; then
  echo "IGNORE check_drillbits.sh" | tee -a $RESULT_FILE
  echo "You have less drillbits than needed for test" | tee -a $RESULT_FILE
  exit 1;
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "create function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE
QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[1]}:31010" -e "create function using jar 'many_tests-1.0.jar';" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"false"*"Jar with many_tests-1.0.jar name has been already registered"* ]]; then
  echo "PASS register_in_past.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL register_in_past.sh" | tee -a $RESULT_FILE
  echo "FAILED: register_in_past.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "false    Jar with many_tests-1.0.jar name has been already registered" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
