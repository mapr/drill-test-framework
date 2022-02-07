#!/bin/bash
source conf/drillTestConfig.properties

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=s3minio.tmp;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=${AUTH_MECHANISM}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/s3minio/s3_pruning.ddl
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=s3minio.tmp;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/s3minio/s3_pruning.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=s3minio.tmp;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/s3minio/s3_pruning.ddl
fi
