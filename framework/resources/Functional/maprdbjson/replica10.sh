cd framework/resources/Functional/maprdbjson
kubectl cp replica10 dataplatform/admincli-0:/tmp
kubectl exec -i admincli-0 -n dataplatform -- /bin/bash /tmp/replica10
