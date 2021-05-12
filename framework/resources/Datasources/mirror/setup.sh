source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Datasources/mirror echo `pwd`

kubectl cp scores.json dataplatform/admincli-0:/tmp
kubectl cp values.json dataplatform/admincli-0:/tmp

