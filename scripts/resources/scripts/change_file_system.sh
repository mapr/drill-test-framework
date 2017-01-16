#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test change_file_system.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/change_file_system.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

mkdir /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}
cp ${DRILL_HOME}/conf/drill-override.conf /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}

echo ',' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo 'drill.exec.udf.directory.fs: "file:///"' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE

if rpm -qa | grep -q mapr-drill; then
  rm -rf /home/mapr/drill/udf/staging/many_tests-1.0* >> $LOG_FILE 2>>${LOG_FILE}
  maprcli node services -name drill-bits -action restart -nodes `hostname -f` >> $LOG_FILE 2>>${LOG_FILE}
  sleep 20
  cp resources/jars/many_tests-1.0* /home/mapr/drill/udf/staging/ >> $LOG_FILE 2>>${LOG_FILE}
else
  ssh "root@`hostname -f`" rm -rf /root/drill/udf/staging/many_tests-1.0* >> $LOG_FILE 2>>${LOG_FILE}
  ssh "root@`hostname -f`" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>>${LOG_FILE}
  sleep 20
  cp resources/jars/many_tests-1.0* /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}
  ssh "root@`hostname -f`" cp /tmp/drill_conf/many_tests-1.0* /root/drill/udf/staging/ >> $LOG_FILE 2>>${LOG_FILE} 
fi

QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "create function using jar 'many_tests-1.0.jar';" 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"true"*"The following UDFs in jar many_tests-1.0.jar have been registered"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL change_file_system.sh" | tee -a $RESULT_FILE
  echo "FAILED: change_file_system.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "true    The following UDFs in jar many_tests-1.0.jar have been registered" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
  exit 1;
fi

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "select manytests('test', ' udf') from (values(1));" 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"test udf"* ]]; then
  echo "PASS change_file_system.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL change_file_system.sh" | tee -a $RESULT_FILE
  echo "FAILED: change_file_system.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test udf" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null

mv /tmp/drill_conf/drill-override.conf ${DRILL_HOME}/conf/drill-override.conf >> $LOG_FILE 2>>${LOG_FILE}
ssh "root@`hostname -f`" rm -rf /tmp/drill_conf/  >> $LOG_FILE 2>>${LOG_FILE}

if rpm -qa | grep -q mapr-drill; then
  rm -rf /home/mapr/drill/udf/ >> $LOG_FILE 2>>${LOG_FILE}
  maprcli node services -name drill-bits -action restart -nodes `hostname -f` >> $LOG_FILE 2>>${LOG_FILE}
else
  ssh "root@`hostname -f`" rm -rf /root/drill/udf/ >> $LOG_FILE 2>>${LOG_FILE}
  ssh "root@`hostname -f`" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>>${LOG_FILE}
fi
sleep 20
