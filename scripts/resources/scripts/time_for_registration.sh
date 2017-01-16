#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test time_for_registration.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/time_for_registration.log

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

start=$SECONDS
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}
end=$(( SECONDS - start ))

if [[ $end -le 10 ]]; then
  echo "PASS time_for_registration.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL time_for_registration.sh" | tee -a $RESULT_FILE
  echo "FAILED: time_for_registration.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Time limit for registration is 10 seconds" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "$end seconds" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
