#!/bin/bash
source conf/drillTestConfig.properties

test_dir=${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/skipHeaderFooter
dfs_location=${DRILL_TESTDATA}/hive_storage

untar_data () {
    local location=$1
    local tar_name=$2
    local file_name=$3

    tar xzvf $location/$tar_name -C $location $file_name
}

copy_to_dfs () {
    local location=$1
    local file_name=$2
    local hive_dir_name=${file_name%.*}
    local file=$location/$file_name
    local destination=$3
    destination+=/$hive_dir_name

    hadoop fs -test -d $destination
    if [ ! $? -eq 0 ]
    then
        hadoop fs -mkdir -p $destination
    fi

    hadoop fs -test -f $destination/$file_name
    if [ ! $? -eq 0 ]
    then
	    hadoop fs -put $file $destination/
    fi
}

prepare_dataset () {
    local location=$1
    local file_name=$2
    local file=$test_dir/$file_name
    local tar_name=$3
    local destination=$4

    # Reusing of existing file if exists
    if [ ! -f $file ]
    then
        untar_data $location $tar_name $file_name
    fi

    copy_to_dfs $location $file_name $destination
}

tar_name="DRILL_5941_data.tar.gz"
prepare_dataset $test_dir "DRILL_5941_lines_count_skip_header_footer_big_data_set.csv" $tar_name $dfs_location

${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh ${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/skipHeaderFooter/DRILL_5941_lines_count_skip_header_footer_create_tables.ddl