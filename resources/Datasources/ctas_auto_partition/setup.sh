hadoop fs -mkdir /drill/testdata/ctas_auto_partition
hadoop fs -rmr /drill/testdata/ctas_auto_partition/tpch_single_partition
hadoop fs -mkdir /drill/testdata/ctas_auto_partition/tpch_single_partition
hadoop fs -rmr /drill/testdata/ctas_auto_partition/tpch_single_partition1
hadoop fs -mkdir /drill/testdata/ctas_auto_partition/tpch_single_partition1

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctasAutoPartition;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/ctas_auto_partition/create_tables.ddl

# it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
        exit 1
fi
