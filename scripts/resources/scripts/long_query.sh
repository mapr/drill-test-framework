#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test long_query.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/long_query.log
IFS=',' read -ra ADDR <<< "$DRILLBITS"

if [ $numDrills -lt 2 ]; then
  echo "IGNORE long_query.sh" | tee -a $RESULT_FILE
  echo "You have less drillbits than needed for test" | tee -a $RESULT_FILE
  exit 1;
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
rm -rf /tmp/long_query* >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "create function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[1]}:31010" -e 'select t1.inv_date_sk, t1.inv_item_sk, t1.inv_warehouse_sk, t1.inv_quantity_on_hand,  manytests(cast(t1.inv_date_sk as varchar), cast(t2.inv_item_sk as varchar)) from dfs.`drill/testdata/tpcds_sf1/json/inventory` t1 inner join (select inv_date_sk, inv_item_sk, manytests(cast(inv_date_sk as varchar), cast(inv_item_sk as varchar)) as tmp_res from dfs.`drill/testdata/tpcds_sf1/json/inventory`) t2 on manytests(cast(t1.inv_date_sk as varchar), cast(t1.inv_item_sk as varchar))=t2.tmp_res where t1.inv_date_sk=2450815 and t1.inv_item_sk=1 and t1.inv_warehouse_sk=3 and t1.inv_quantity_on_hand=494 limit 1;' >> /tmp/long_query 2>>/tmp/long_query &
sleep 10
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${ADDR[0]}:31010" -e "drop function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

sleep 60

QUERY_RESULT=$(cat /tmp/long_query)
echo "${QUERY_RESULT/: /\n}" >> $LOG_FILE 2>> $LOG_FILE

if [[ $QUERY_RESULT == *"2450815"*"1"*"3"*"494"*"24508151"* ]]; then
  echo "PASS long_query.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL long_query.sh" | tee -a $RESULT_FILE
  echo "FAILED: long_query.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "2450815    1    3    494    24508151" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "${QUERY_RESULT/: /\n}" >> $FAILS_FILE 2>> $FAILS_FILE
fi

rm -rf /tmp/long_query* >> /dev/null 2>>/dev/null
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
