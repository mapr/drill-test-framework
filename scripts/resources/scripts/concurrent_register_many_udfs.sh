#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test concurrent_register_many_udfs.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/concurrent_register_many_udfs.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

hadoop fs -rm /user/$UDF_USER/drill/udf/staging/concurrency_test_* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/concurrency_registration_test/concurrency_test_* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_1-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_2-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_3-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_4-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_5-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_6-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_7-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_8-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_9-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_10-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_11-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_12-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_13-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_14-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_15-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_16-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_17-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_18-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_19-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_20-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'concurrency_test_21-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE} &
sleep 60

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "select concurrency_test1(), concurrency_test2(), concurrency_test3(), concurrency_test4(), concurrency_test5(), concurrency_test6(), concurrency_test7(), concurrency_test8(), concurrency_test9(), concurrency_test10(), concurrency_test11(), concurrency_test12(), concurrency_test13(), concurrency_test14(), concurrency_test15(), concurrency_test16(), concurrency_test17(), concurrency_test18(), concurrency_test19(), concurrency_test20(), concurrency_test21() from (values(1));" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"test1"*"test2"*"test3"*"test4"*"test5"*"test6"*"test7"*"test8"*"test9"*"test10"*"test11"*"test12"*"test13"*"test14"*"test15"*"test16"*"test17"*"test18"*"test19"*"test20"*"test21"* ]]; then
  echo "PASS concurrent_register_many_udfs.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL concurrent_register_many_udfs.sh" | tee -a $RESULT_FILE
  echo "FAILED: concurrent_register_many_udfs.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test1 test2 test3 test4 test5 test6 test7 test8 test9 test10 test11 test12 test13 test14 test15 test16 test17 test18 test19 test20 test21"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_1-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_2-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_3-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_4-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_5-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_6-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_7-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_8-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_9-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_10-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_11-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_12-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_13-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_14-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_15-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_16-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_17-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_18-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_19-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_20-1.0.jar';" >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'concurrency_test_21-1.0.jar';" >> /dev/null 2>>/dev/null
