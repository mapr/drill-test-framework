#!/bin/bash
# $1 - the name of the pod to copy the scripts to
cname=`./getDPName.sh`

kubectl cp getDPName.sh $cname/$1:/tmp/getDPName.sh
kubectl cp checkStop.sh $cname/$1:/tmp/checkStop.sh
kubectl cp removePID.sh $cname/$1:/tmp/removePID.sh
kubectl cp /tmp/MaprPasswd $cname/$1:/tmp/MaprPasswd
kubectl cp maprLogin.sh $cname/$1:/tmp/maprLogin.sh
kubectl cp header.sh $cname/$1:/tmp/header.sh
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/getDPName.sh
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/checkStop.sh
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/removePID.sh
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/maprLogin.sh
kubectl exec $1 -n $cname -- chmod u=rwx /tmp/header.sh
