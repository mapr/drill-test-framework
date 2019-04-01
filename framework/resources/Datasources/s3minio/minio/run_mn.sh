#!/bin/sh
source conf/drillTestConfig.properties

export MINIO_ACCESS_KEY=ZYVR33VM12IAHETIJYF9
export MINIO_SECRET_KEY=BjGb9WpNd74t5T7FcBlXRgUcSyq505G598T8Yxg6

if [ -z "$(top -bn1 |grep minio |grep -oE '^[ ]*[0-9]+' |grep -oE '[0-9]+')" ]
then
  nohup ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio server ${DRILL_TEST_DATA_DIR}/Datasources/s3minio/minio/minio_data >> ~/nohup.out &
  sleep 1
fi
