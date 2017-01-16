#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test register_with_less_drillbits2 started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/register_with_less_drillbits2.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

if [ $numDrills -lt 2 ]; then
  echo "IGNORE register_with_less_drillbits2" | tee -a $RESULT_FILE
  echo "You have less drillbits than needed for test" | tee -a $RESULT_FILE
  exit 1;
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'register_with_less_drillbits-1.0.jar';" >> /dev/null 2>>/dev/null

hadoop fs -rm /user/$UDF_USER/drill/udf/staging/register_with_less_drillbits-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/register_with_less_drillbits-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action stop -nodes ${ADDR[0]} >> $LOG_FILE 2>> $LOG_FILE
else
  ssh "root@${ADDR[0]}" $DRILL_HOME/bin/drillbit.sh stop >> $LOG_FILE 2>> $LOG_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'register_with_less_drillbits-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}
QUERY_TMP_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "select registerlessdrillbits('test',' udf') from (values(1));" 2>&1)
echo "${QUERY_TMP_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_TMP_RESULT != *"test udf"* ]]; then
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL register_with_less_drillbits2.sh" | tee -a $RESULT_FILE
  echo "FAILED: register_with_less_drillbits2.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "test udf" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_TMP_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'register_with_less_drillbits-1.0.jar';" >> /dev/null 2>>/dev/null
  exit 1;
fi

if rpm -qa | grep -q mapr-drill; then
  maprcli node services -name drill-bits -action start -nodes ${ADDR[0]} >> $LOG_FILE 2>> $LOG_FILE
else
  ssh "root@${ADDR[0]}" $DRILL_HOME/bin/drillbit.sh start >> $LOG_FILE 2>> $LOG_FILE
fi

sleep 10

QUERY_RESULT=$(${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e 'select t1.inv_date_sk, t1.inv_item_sk, t1.inv_warehouse_sk, t1.inv_quantity_on_hand,  registerlessdrillbits(cast(t1.inv_date_sk as varchar), cast(t2.inv_item_sk as varchar)) from dfs.`drill/testdata/tpcds_sf1/json/inventory` t1 inner join (select inv_date_sk, inv_item_sk, registerlessdrillbits(cast(inv_date_sk as varchar), cast(inv_item_sk as varchar)) as tmp_res from dfs.`drill/testdata/tpcds_sf1/json/inventory`) t2 on registerlessdrillbits(cast(t1.inv_date_sk as varchar), cast(t1.inv_item_sk as varchar))=t2.tmp_res where t1.inv_date_sk=2450815 and t1.inv_item_sk=1 and t1.inv_warehouse_sk=3 and t1.inv_quantity_on_hand=494 limit 1;' 2>&1)

echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'register_with_less_drillbits-1.0.jar';" >> /dev/null 2>>/dev/null

if [[ $QUERY_RESULT == *"2450815"*"1"*"3"*"494"*"24508151"* ]]; then
  echo "PASS register_with_less_drillbits2.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL register_with_less_drillbits2.sh" | tee -a $RESULT_FILE
  echo "FAILED: register_with_less_drillbits2.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "2450815    1    3    494    24508151" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi
