set -x

cd framework/resources/Functional/mirror

kubectl cp mirror dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate1 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate2 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate3 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate5 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate6 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate7 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate8 dataplatform/cldb-0:/tmp
kubectl cp hbase.replicate9 dataplatform/cldb-0:/tmp
kubectl exec -i cldb-0 -n dataplatform -- /bin/bash -c "/tmp/mirror"

