#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

if [ ! -d /tmp/schema_change_empty_batch/psv/part ]
    then

        echo "Creating directory /tmp/schema_change_empty_batch/psv/part"

        mkdir -p /tmp/schema_change_empty_batch/psv/part

        echo "Creating source files"

        split -l 5000 ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/psv/part.tbl /tmp/schema_change_empty_batch/psv/part/part

        find /tmp/schema_change_empty_batch/psv/part/ -type f ! -name "*.*" -exec mv {} {}.tbl \;

        echo "Creating empty files"

        touch /tmp/schema_change_empty_batch/psv/part/parta{f..h}.tbl

fi

set +x
