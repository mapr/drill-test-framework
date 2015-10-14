#!/bin/sh

# If directory exists, remove it. note here 'complex.json' is actually a directory. 
#I kept the name the same so I don't need to modify existing queries
# due to a hadoop file system bug in version 4.0.2, we can't test if the dir exists
#hadoop fs -test -d /drill/testdata/complex/parquet/complex.json
#if [ "$?" -eq 0 ]
#then
	hadoop fs -rmr /drill/testdata/complex/parquet/complex.json
#fi

hadoop fs -mkdir /drill/testdata/complex/parquet
hadoop fs -chmod 777 /drill/testdata/complex/parquet

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDirComplexParquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/ctas/create_tables_complex_parquet.ddl

# TODO: it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
	exit 0
else
	echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
	exit 1
fi

