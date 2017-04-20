#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test unregistration_regular.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/unregistration_regular.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

rm -rf ${DRILL_HOME}/jars/3rdparty/regular-1.0* >> $LOG_FILE 2>> $LOG_FILE
cp  resources/jars/regular-1.0* ${DRILL_HOME}/jars/3rdparty/ >> $LOG_FILE 2>> $LOG_FILE

if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action restart -nodes $(hostname -f) >> $LOG_FILE 2>> $LOG_FILE
else
  ssh "root@$(hostname -f)" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>> $LOG_FILE
fi
sleep 20

QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=$(hostname -f):31010" -e "select regular() from (values(1));" 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"Regular UDF is working"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL unregistration_regular.sh" | tee -a $RESULT_FILE
  echo "FAILED: unregistration_regular.sh"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Regular UDF is working"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  rm -rf ${DRILL_HOME}/jars/3rdparty/regular-1.0* >> /dev/null 2>> /dev/null
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE  
  exit 1;
fi

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=$(hostname -f):31010" -e "drop function using jar 'regular-1.0.jar';" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"false"*"Jar regular-1.0.jar is not registered in remote registry"* ]]; then
  echo "PASS " unregistration_regular.sh| tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL unregistration_regular.sh" | tee -a $RESULT_FILE
  echo "FAILED: unregistration_regular.sh55"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: "  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "false    Jar regular-1.0.jar is not registered in remote registry"  >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

rm -rf ${DRILL_HOME}/jars/3rdparty/regular-1.0* >> /dev/null 2>> /dev/null
if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action restart -nodes $(hostname -f) >> /dev/null 2>> /dev/null
else
  ssh "root@$(hostname -f)" $DRILL_HOME/bin/drillbit.sh restart >> /dev/null 2>> /dev/null
fi
sleep 20
