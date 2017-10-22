#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/complex/parquet/complex.json
if [ "$?" -eq 0 ]
then
	hadoop fs -rm -r /drill/testdata/complex/parquet/complex.json
fi

hadoop fs -mkdir /drill/testdata/complex/parquet
hadoop fs -chmod 777 /drill/testdata/complex/parquet

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.drillTestDirComplexParquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/create_tables_complex_parquet.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDirComplexParquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/create_tables_complex_parquet.ddl
fi

# TODO: it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
	exit 0
else
	echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
	exit 1
fi

