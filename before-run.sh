
# set -x

cluster=$(kubectl get dataplatform | grep -v NAME | awk '{print $1}')
password=$(kubectl get secret system -n $cluster -o yaml | grep MAPR_PASSWORD | head -1 | awk '{print $2}' | base64 --decode)
# password="mapr"

errors=0

for i in $(kubectl get pods -n $cluster | grep -v NAME | grep -v init | awk '{print $1}')
do
  ret=$(kubectl exec -i $i -n $cluster -- bash -c "echo \"$password\" | maprlogin password -user mapr" 2>&1)
  if ! { [[ $ret == "MapR credentials of user 'mapr' for cluster '$cluster' are written to '/tmp/maprticket_5000'" ]] ; }
  then
    echo "cannot get mapr ticket for " $i
    echo $ret
    ((errors++))
  fi
done

ret=$(kubectl exec -i -n internaltenant `kubectl get pods -n internaltenant|grep tenantcli|awk '{print $1}'` -- bash -c "echo \"$password\" | maprlogin password -user mapr" 2>&1)
if ! { [[ $ret == "MapR credentials of user 'mapr' for cluster '$cluster' are written to '/tmp/maprticket_5000'" ]] ; }
then
  echo "cannot get mapr ticket for tenantcli-0" 
  echo $ret
  ((errors++))
fi

echo errors $errors
exit $errors
