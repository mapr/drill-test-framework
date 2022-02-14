cd framework/resources/Advanced/upgrade

cluster=$(get_cluster)

./cldb40.sh2 $cluster
./zk40.sh2 $cluster

kubectl get pods -n $cluster
