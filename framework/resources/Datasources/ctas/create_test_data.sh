#!/bin/bash
source conf/drillTestConfig.properties

ddl_file=$1
schema_name=$2
schema_location=$3
partition_pruning_ddl=$4

test_data_path="$schema_location/DRILL_6173"
test_src="PRTTN.csv"

hadoop fs -test -d $test_data_path

if [ $? -eq 0 ]
then
    hadoop fs -rm -r $test_data_path
fi

#START=$(date +%s)

hadoop fs -mkdir $test_data_path
hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/ctas/$test_src $schema_location/
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.$schema_name;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/$ddl_file

#END=$(date +%s)
#DIFF=$(( $END - $START ))
#echo "It took $DIFF seconds"

if [ $# -eq 4 ]
then
    hive -f "${DRILL_TEST_DATA_DIR}$partition_pruning_ddl"
fi

hadoop fs -rm $schema_location/$test_src
