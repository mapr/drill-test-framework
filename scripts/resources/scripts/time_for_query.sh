#!/bin/bash

#------------------------------------------------------------------------
echo "" | tee -a results/result.log
echo "Test time_for_query.sh started" | tee -a results/result.log
#------------------------------------------------------------------------ 

export LOG_FILE=logs/time_for_query.log

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
hadoop fs -rm /user/$UDF_USER/drill/udf/staging/many_tests-1.0* >> ${LOG_FILE} 2>>${LOG_FILE}
hadoop fs -put resources/jars/many_tests-1.0* /user/$UDF_USER/drill/udf/staging/ >> $LOG_FILE 2>> $LOG_FILE


${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "create function using jar 'many_tests-1.0.jar';" >> $LOG_FILE 2>>${LOG_FILE}

start=$SECONDS
${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e 'select t1.inv_date_sk, t1.inv_item_sk, t1.inv_warehouse_sk, t1.inv_quantity_on_hand,  manytests(cast(t1.inv_date_sk as varchar), cast(t2.inv_item_sk as varchar)) from dfs.`drill/testdata/tpcds_sf1/json/inventory` t1 inner join (select inv_date_sk, inv_item_sk, manytests(cast(inv_date_sk as varchar), cast(inv_item_sk as varchar)) as tmp_res from dfs.`drill/testdata/tpcds_sf1/json/inventory`) t2 on manytests(cast(t1.inv_date_sk as varchar), cast(t1.inv_item_sk as varchar))=t2.tmp_res where t1.inv_date_sk=2450815 and t1.inv_item_sk=1 and t1.inv_warehouse_sk=3 and t1.inv_quantity_on_hand=494 limit 1;' >> $LOG_FILE 2>>${LOG_FILE}
end=$(( SECONDS - start ))

if [[ $end -le 80 ]]; then
  echo "PASS time_for_query.sh" | tee -a $RESULT_FILE
else
  echo "-----------------------------------------------"  >> $FAILS_FILE 2>> $FAILS_FILE
  echo "FAIL time_for_query.sh" | tee -a $RESULT_FILE
  echo "FAILED: time_for_query.sh" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "EXPECTED RESULT: " >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "Time limit for query is 80 seconds" >>  $LOG_FILE >> $FAILS_FILE 2>> $LOG_FILE 2>> $FAILS_FILE
  echo "ACTUAL RESULT: " >> $FAILS_FILE 2>> $FAILS_FILE
  echo "$end seconds" >> $FAILS_FILE 2>> $FAILS_FILE
fi

${DRILL_HOME}/bin/sqlline -u "jdbc:drill:zk=${ZOOKEEPER_HOST}:5181" -e "drop function using jar 'many_tests-1.0.jar';" >> /dev/null 2>>/dev/null
