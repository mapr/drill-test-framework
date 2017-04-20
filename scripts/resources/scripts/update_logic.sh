#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test update_logic.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/update_logic.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

if [ $numDrills -lt 2 ]; then
  echo "IGNORE update_logic.sh" | tee -a $RESULT_FILE
  echo "You have less drillbits than needed for test" | tee -a $RESULT_FILE
  exit 1;
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'update_logic-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/update_logic-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/before_update/update_logic-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "create function using jar 'update_logic-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "select updatelogic() from (values(1));" 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"Logic before update"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL update_logic.sh" | tee -a $RESULT_FILE
  echo "FAILED: update_logic.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Logic before update"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'update_logic-1.0.jar';" >> /dev/null 2>>/dev/null
  exit 1;
fi

if rpm -qa | grep -q mapr-drill; then
  DRILLBITS_SPACE=`echo $DRILLBITS | sed 's/,/ /g'`
  maprcli node services -name drill-bits -action stop -nodes ${ADDR[0]} >> $LOG_FILE 2>> $LOG_FILE
else
  ssh "root@${ADDR[0]}" $DRILL_HOME/bin/drillbit.sh stop >> $LOG_FILE 2>> $LOG_FILE
fi

hadoop fs -rm /user/$UDF_USER/drill/udf/staging/update_logic-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/after_update/update_logic-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[1]}:31010" -e "drop function using jar 'update_logic-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[1]}:31010" -e "create function using jar 'update_logic-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

if rpm -qa | grep -q mapr-drill; then
  DRILLBITS_SPACE=`echo $DRILLBITS | sed 's/,/ /g'`
  maprcli node services -name drill-bits -action start -nodes ${ADDR[0]} >> $LOG_FILE 2>> $LOG_FILE
else
  ssh "root@${ADDR[0]}" $DRILL_HOME/bin/drillbit.sh start >> $LOG_FILE 2>> $LOG_FILE
fi
sleep 20

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "select updatelogic() from (values(1));" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"Logic is updated"* ]]; then
  echo "PASS update_logic.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL update_logic.sh" | tee -a $RESULT_FILE
  echo "FAILED: update_logic.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Logic is updated"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'update_logic-1.0.jar';" >> /dev/null 2>>/dev/null
