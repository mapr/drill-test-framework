#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/concurrency
if [ "$?" -eq 0 ]
then
	hadoop fs -rm -r /drill/testdata/concurrency
fi

hadoop fs -mkdir /drill/testdata/concurrency
hadoop fs -chmod 777 /drill/testdata/concurrency

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.concurrency;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/concurrency/tpchsf100_views.ddl

