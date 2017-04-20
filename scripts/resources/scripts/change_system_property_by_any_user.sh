#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test change_system_property_by_any_user.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/change_system_property_by_any_user.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

rm -rf /tmp/pam/ >> $LOG_FILE 2>>${LOG_FILE}
cp -r resources/pam/ /tmp/ >> $LOG_FILE 2>>${LOG_FILE}

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "alter system set security.admin.users = 'mapr';" >> $LOG_FILE 2>>${LOG_FILE}

mkdir /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}
cp ${DRILL_HOME}/conf/drill-env.sh /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}
cp ${DRILL_HOME}/conf/drill-override.conf /tmp/drill_conf/ >> $LOG_FILE 2>>${LOG_FILE}

echo 'export DRILL_JAVA_OPTS="$DRILL_JAVA_OPTS -Djava.library.path=/tmp/pam/ "' >> ${DRILL_HOME}/conf/drill-env.sh 2>> $LOG_FILE
echo ',' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo 'drill.exec.security.user.auth: {' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo '   enabled: true,' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo '   packages += "org.apache.drill.exec.rpc.user.security",' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo '   impl: "pam",' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo '   pam_profiles: [ "sudo", "login" ]' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE
echo '}' >> ${DRILL_HOME}/conf/drill-override.conf 2>> $LOG_FILE

if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action restart -nodes `hostname -f` >> $LOG_FILE 2>>${LOG_FILE}
else
  ssh "root@`hostname -f`" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>>${LOG_FILE}
fi
sleep 20

QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -n user1 -p user1 -e 'alter system set `exec.udf.enable_dynamic_support` = true;' 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"PERMISSION ERROR"*"Not authorized to change SYSTEM options"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL change_system_property_by_any_user.sh" | tee -a $RESULT_FILE
  echo "FAILED: change_system_property_by_any_user.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "PERMISSION ERROR: Not authorized to change SYSTEM options" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "alter system reset security.admin.users;" >> $LOG_FILE 2>>${LOG_FILE}
  exit 1;
fi

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -n mapr -p mapr -e 'alter system set `exec.udf.enable_dynamic_support` = true;' 2>&1)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"true"*"exec.udf.enable_dynamic_support updated"* ]]; then
  echo "PASS change_system_property_by_any_user.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL change_system_property_by_any_user.sh" | tee -a $RESULT_FILE
  echo "FAILED: change_system_property_by_any_user.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "true    exec.udf.enable_dynamic_support updated" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

mv /tmp/drill_conf/drill-env.sh ${DRILL_HOME}/conf/drill-env.sh >> $LOG_FILE 2>>${LOG_FILE}
mv /tmp/drill_conf/drill-override.conf ${DRILL_HOME}/conf/drill-override.conf >> $LOG_FILE 2>>${LOG_FILE}
rm -rf /tmp/drill_conf/  >> $LOG_FILE 2>>${LOG_FILE}

if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action restart -nodes `hostname -f` >> $LOG_FILE 2>>${LOG_FILE}
else
  ssh "root@`hostname -f`" $DRILL_HOME/bin/drillbit.sh restart >> $LOG_FILE 2>>${LOG_FILE}
fi
sleep 20

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=`hostname -f`:31010" -e "alter system reset security.admin.users;" >> $LOG_FILE 2>>${LOG_FILE}
rm -rf /tmp/pam/ >> $LOG_FILE 2>>${LOG_FILE}
