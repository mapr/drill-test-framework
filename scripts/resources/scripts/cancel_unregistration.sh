#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test cancel_unregistration.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/cancel_unregistration.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "select manytests('test', ' udf') from (values(1));" 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"test udf"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL cancel_unregistration.sh" | tee -a $RESULT_FILE
  echo "FAILED: cancel_unregistration.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test udf"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
  exit 1;
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
kill %1 >> $LOG_FILE 2>>${LOG_FILE}
wait %1 2>>${LOG_FILE}

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "select manytests('test', ' udf') from (values(1));" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"test udf"* ]]; then
  echo "PASS cancel_unregistration.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL cancel_unregistration.sh" | tee -a $RESULT_FILE
  echo "FAILED: cancel_unregistration.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test udf"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
