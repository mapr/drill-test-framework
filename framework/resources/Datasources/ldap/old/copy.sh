set -x

source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Datasources/ldap
echo `pwd`
kubectl exec -i -n dataplatform admincli-0 -- sudo /bin/rm -r /tmp/ldapfiles
tar cf - ./ldapfiles | kubectl exec -i -n dataplatform admincli-0 -- sudo tar xf - -C /tmp

kubectl exec -i -n dataplatform admincli-0 -- sudo /bin/rm -r /tmp/linuxfiles
kubectl cp ./linuxfiles/linuxuser_setup.sh dataplatform/admincli-0:/tmp
kubectl exec -i -n dataplatform admincli-0 -- sudo /tmp/linuxuser_setup.sh
tar cf - ./linuxfiles | kubectl exec -i -n dataplatform admincli-0 -- sudo tar xf - -C /tmp

kubectl cp copyToMfs.sh dataplatform/admincli-0:/tmp
kubectl exec -i -n dataplatform admincli-0 -- sudo /tmp/copyToMfs.sh

