set -x

cd framework/resources/Functional/mirror

kubectl cp mirror dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate1 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate2 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate3 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate5 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate6 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate7 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate8 dataplatform/admincli-0:/tmp
kubectl cp hbase.replicate9 dataplatform/admincli-0:/tmp
kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c "/tmp/mirror"

