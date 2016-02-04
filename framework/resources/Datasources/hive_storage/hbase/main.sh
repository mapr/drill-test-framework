#!/bin/bash

set -x
set -e

resources/Datasources/hive_storage/hbase/hbase.sh

wait

resources/bin/execHive.sh resources/Datasources/hive_storage/hive_hbase.q

set +x
