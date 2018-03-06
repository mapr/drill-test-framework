#!/usr/bin/env bash
source conf/drillTestConfig.properties

schema="drillTestDir"
ddl_location="${DRILL_TEST_DATA_DIR}/Datasources/parquet_storage/DRILL-6118/DRILL_6118_*.ddl"


execute_ddl () {
  local ddl=$1
  if [ -z "$PASSWORD" ]
  then
    ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=$schema;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=$ddl
  else
    ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=$schema;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=$ddl
  fi
}

for ddl in $ddl_location
do
  execute_ddl $ddl
done