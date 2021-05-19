
# set -x

password=$(kubectl get secret system -n dataplatform -o yaml | grep MAPR_PASSWORD | head -1 | awk '{print $2}' | base64 --decode)
# password="mapr"

errors=0

for i in $(kubectl get pods -n dataplatform | grep -v NAME | grep -v init | awk '{print $1}')
do
  ret=$(kubectl exec -i $i -n dataplatform -- bash -c "echo \"$password\" | maprlogin password -user mapr" 2>&1)
  if ! { [[ $ret == "MapR credentials of user 'mapr' for cluster 'dataplatform' are written to '/tmp/maprticket_5000'" ]] ; }
  then
    echo "cannot get mapr ticket for " $i
    echo $ret
    ((errors++))
  fi
done

ret=$(kubectl exec -i -n internaltenant `kubectl get pods -n internaltenant|grep tenantcli|awk '{print $1}'` -- bash -c "echo \"$password\" | maprlogin password -user mapr" 2>&1)
if ! { [[ $ret == "MapR credentials of user 'mapr' for cluster 'dataplatform' are written to '/tmp/maprticket_5000'" ]] ; }
then
  echo "cannot get mapr ticket for " $i
  echo $ret
  ((errors++))
fi

echo errors $errors
exit $errors
