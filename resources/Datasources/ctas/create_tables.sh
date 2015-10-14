#!/bin/sh

# If directory exists, remove it
hadoop fs -test -d /drill/testdata/ctas/parquet 
if [ "$?" -eq 0 ]
then 
	hadoop fs -rmr /drill/testdata/ctas/parquet 
fi

hadoop fs -mkdir /drill/testdata/ctas/parquet 

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctas_parquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/ctas/create_tables_parquet.ddl

# TODO: it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
	exit 0
else
	echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
	exit 1
fi

# TODO: add verification of parquet schema with parquet-tools
# TODO: add verification of number of files created

