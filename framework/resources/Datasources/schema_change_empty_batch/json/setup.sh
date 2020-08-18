#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

if [ ! -d ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part ]
    then

        echo "Creating directory ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part"

        mkdir -p ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part

        echo "Creating directory ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp"

        mkdir -p ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp

        echo "Creating directory ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/empty"

        mkdir -p ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/empty

        echo "Creating source files"

        split -l 5000 ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part.json ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part/part

        split -l 20000 ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp.json ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp/partsupp

        find ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part/ -type f ! -name "*.*" -exec mv {} {}.json \;

        find ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp/ -type f ! -name "*.*" -exec mv {} {}.json \;

        echo "Creating empty files"

        touch ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part/parta{f..h}.json

        touch ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp/partsuppa{f..h}.json

        touch ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/empty/empty{a..d}.json

fi

if ! $(hadoop fs -test -d ${DRILL_TESTDATA}/schema_change_empty_batch/json)
    then

        echo "Copying to hadoop"

        hadoop fs -mkdir -p ${DRILL_TESTDATA}/schema_change_empty_batch/json

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part ${DRILL_TESTDATA}/schema_change_empty_batch/json/

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/partsupp ${DRILL_TESTDATA}/schema_change_empty_batch/json/

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/empty ${DRILL_TESTDATA}/schema_change_empty_batch/json/

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/part_small ${DRILL_TESTDATA}/schema_change_empty_batch/json/

fi

set +x
