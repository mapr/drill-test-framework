set -x

source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Datasources/maprdbjson echo `pwd`

kubectl cp grades.json dataplatform/admincli-0:/tmp
kubectl cp scores.json dataplatform/admincli-0:/tmp
kubectl cp values.json dataplatform/admincli-0:/tmp
kubectl cp valuesm1.json dataplatform/admincli-0:/tmp
# kubectl cp valuesm1e.json dataplatform/admincli-0:/tmp
kubectl cp load_data dataplatform/admincli-0:/tmp
kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c "/tmp/load_data"
kubectl cp waitForReplicationToComplete dataplatform/admincli-0:/tmp
# kubectl cp load_data_jsonapps dataplatform/admincli-0:/tmp
# kubectl cp hbase.replicate1 dataplatform/admincli-0:/tmp
# kubectl cp hbase.replicate2 dataplatform/admincli-0:/tmp
# kubectl cp hbase.replicate3 dataplatform/admincli-0:/tmp
# kubectl cp hbase.replicate4 dataplatform/admincli-0:/tmp
# kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c "/tmp/load_data_jsonapps"
