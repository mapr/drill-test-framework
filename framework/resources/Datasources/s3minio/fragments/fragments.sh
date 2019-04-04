#!/bin/bash
source conf/drillTestConfig.properties

mkdir ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio_data/tstbucket/tmp/big_files

tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio_data/tstbucket/tmp/big_files
tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_prec.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio_data/tstbucket/tmp/big_files
tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_scale.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio_data/tstbucket/tmp/big_files

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=s3minio.tmp;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/s3minio/fragments/fragments.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=s3minio.tmp;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/s3minio/fragments/fragments.ddl
fi
