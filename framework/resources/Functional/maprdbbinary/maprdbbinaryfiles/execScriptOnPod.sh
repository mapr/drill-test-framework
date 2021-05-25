#$1 the name of the pod to run a script on
#$2 the name of the script to be run
. ./checkStop.sh
cname=`./getDPName.sh`

./putCommonScripts.sh $1
./stopScriptOnPod.sh $1 $2

echo `date` executing $2 on $1
kubectl cp $2 $cname/$1:/tmp/$2
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/$2
kubectl exec $1 -n $cname -- /bin/bash "/tmp/$2"
status=$?
kubectl exec $1 -n $cname -- rm -rf /tmp/$2
kubectl exec $1 -n $cname -- rm -rf /tmp/getDPName.sh
exit $status
