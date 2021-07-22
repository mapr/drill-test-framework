cd framework/resources/Functional/pbs

kubectl cp pbs dataplatform/admincli-0:/tmp
kubectl exec -i admincli-0 -n dataplatform -- /bin/bash -c "/tmp/pbs"

