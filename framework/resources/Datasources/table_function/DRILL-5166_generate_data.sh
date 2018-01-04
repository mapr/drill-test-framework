#!/bin/bash
source conf/drillTestConfig.properties

test_dir=${DRILL_TEST_DATA_DIR}/Datasources/table_function
dfs_location=${DRILL_TESTDATA}/table_function

untar_data () {
    local location=$1
    local tar_name=$2
    local file_name=$3

    tar xzvf $location/$tar_name -C $location ./$file_name
}

copy_to_dfs () {
    local location=$1
    local file_name=$2
    local file=$location/$file_name
    local destination=$3

    hadoop fs -test -f $destination/$file_name
    if [ $? -eq 0 ]
    then
	    hadoop fs -rm -r $destination/$file_name
    fi
    hadoop fs -put $file $destination/
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
        copy_to_dfs $location $file_name $destination        
    fi
}

base_file_name="DRILL-5166_NPE_with_table_function"
tar_name="DRILL-5166_data.tar.gz"
prepare_dataset $test_dir ${base_file_name}_group_select_1.csv $tar_name $dfs_location
prepare_dataset $test_dir ${base_file_name}_group_select_2.csv $tar_name $dfs_location
prepare_dataset $test_dir ${base_file_name}_large_file.csv $tar_name $dfs_location
