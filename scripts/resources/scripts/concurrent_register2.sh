#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test concurrent_register2.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/concurrent_register2.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
rm -rf /tmp/concurrent_one_register* >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "create function using jar 'many_tests-1.0.jar';" >> /tmp/concurrent_one_register1 2>>/tmp/concurrent_register1 &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "create function using jar 'many_tests-1.0.jar';" >> /tmp/concurrent_one_register2 2>>/tmp/concurrent_register2 &
sleep 15

QUERY_RESULT1=$(cat /tmp/concurrent_one_register1)
QUERY_RESULT2=$(cat /tmp/concurrent_one_register2)
QUERY_RESULT="$QUERY_RESULT1 $QUERY_RESULT2"
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"true"*"false"* ]] || [[ $QUERY_RESULT == *"false"*"true"* ]]; then
  echo "PASS concurrent_register2.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL concurrent_register2.sh" | tee -a $RESULT_FILE
  echo "FAILED: concurrent_register2.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test udf" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

rm -rf /tmp/concurrent_one_register* >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
