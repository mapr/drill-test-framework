#$1 the name of the pod to run a script on
#$2 the name of the script to be run

#output several blank lines to screen for visual seperator
count=0
while [ $count -lt 20 ]
do
  count=$((count+1))
  echo ""
done

# stop any old instance of this script already running on the pod
status=0
while [ $status -eq 0 ]
  do
  pid=`kubectl exec -i $1 -n dataplatform -- ps -ef | grep $2 | tr -s " " | grep " 0 0 "` 2>&1 > /dev/null
  status=$?
  if [ $status -eq 0 ]
  then
    pid=`echo $pid | cut -d " " -f 2`
    kubectl exec -i $1 -n dataplatform -- kill -9 $pid
    echo `date` old instance of $2 killed on $1
    sleep 5
  fi
done

echo `date` executing $2 on $1
kubectl cp $2 dataplatform/$1:/tmp/$2
kubectl exec -i $1 -n dataplatform -- chmod u=rwx /tmp/$2
kubectl exec -i $1 -n dataplatform -- /bin/bash "/tmp/$2"
status=$?
kubectl exec -i $1 -n dataplatform -- rm -rf /tmp/$2
exit $status
