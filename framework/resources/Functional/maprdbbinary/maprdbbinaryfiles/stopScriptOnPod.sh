#$1 the name of the pod to run a script on
#$2 the name of the script to be run
cname=`./getDPName.sh`

# stop any old instance of this script already running on the pod
status=0
while [ $status -eq 0 ]
  do
  pid=`kubectl exec $1 -n $cname -- ps -ef | grep $2 | tr -s " " | grep " 0 0 "` 2>&1 > /dev/null
  status=$?
  if [ $status -eq 0 ]
  then
    spid="$pid"
    pid=`echo $pid | cut -d " " -f 2`
    kubectl exec $1 -n $cname -- kill -9 $pid
    if [ $? -eq 0 ]
      then
      echo `date` old instance of $2 killed on $1 with pid: $pid
    else
      echo output of ps follows;
      `kubectl exec $1 -n $cname -- ps -ef | grep $2 | tr -s " " | grep -v grep`
      echo output of ps and grep follows:
      `kubectl exec $1 -n $cname -- ps -ef | grep $2 | tr -s " " | grep " 0 " | grep -v grep`
      echo "pid->$pid<-"
      echo "spid->$spid<-"
      echo "cut 1->`echo $spid | cut -d " " -f 1`<-"
      echo "cut 2->`echo $spid | cut -d " " -f 2`<-"
      echo "cut 3->`echo $spid | cut -d " " -f 3`<-"
    fi
    sleep 5
  fi
done
