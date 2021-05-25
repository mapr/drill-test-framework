set -x

source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Datasources/ldap echo `pwd`

# set up mapr user, ldap users and linux users.
# ldapusers are needed because file ownership/permissions are
# set up on the host before copying to the pods.
./mapr_setup.sh
./ldapuser_setup.sh
./linuxuser_setup.sh

# set ownership and permission bits on ldap files
chmod 777 ./ldapfiles
chmod 777 ./linuxfiles
./ldapfiles.chmod.sh
./linuxfiles.chmod.sh

# copy ldap files to admincli pod
kubectl exec -i -n dataplatform admincli-0 -- sudo /bin/rm -r /tmp/ldapfiles
kubectl exec -i -n dataplatform admincli-0 -- sudo ls -al /tmp
tar cf - ./ldapfiles | kubectl exec -i -n dataplatform admincli-0 -- sudo tar xf - -C /tmp

# setup linux users on all pods, so that when linuxfiles are copied there, the owners are defined
# all cldb pods need to have linux users defined since maprlogin may use any of them to verify users
# tenant pod needs to have linux users for submitting spark jobs
kubectl cp ./linuxuser_setup.sh dataplatform/admincli-0:/tmp
kubectl exec -i -n dataplatform admincli-0 -- sudo /tmp/linuxuser_setup.sh

kubectl cp ./linuxuser_setup.sh dataplatform/cldb-0:/tmp
kubectl exec -i -n dataplatform cldb-0 -- sudo /tmp/linuxuser_setup.sh

kubectl cp ./linuxuser_setup.sh dataplatform/cldb-1:/tmp
kubectl exec -i -n dataplatform cldb-1 -- sudo /tmp/linuxuser_setup.sh

kubectl cp ./linuxuser_setup.sh dataplatform/cldb-2:/tmp
kubectl exec -i -n dataplatform cldb-2 -- sudo /tmp/linuxuser_setup.sh

kubectl cp ./linuxuser_setup.sh internaltenant/tenantcli-0:/tmp
kubectl exec -i -n internaltenant tenantcli-0 -- sudo /tmp/linuxuser_setup.sh

# copy linuxfiles to admincli pod
kubectl exec -i -n dataplatform admincli-0 -- sudo /bin/rm -r /tmp/linuxfiles
tar cf - ./linuxfiles | kubectl exec -i -n dataplatform admincli-0 -- sudo tar xf - -C /tmp

# copy ldapfiles and linuxfiles to mfs from within admincli pod
kubectl cp copyToMfs.sh dataplatform/admincli-0:/tmp
password=$(./get_mapr_password.sh)
kubectl exec -i -n dataplatform admincli-0 -- bash -c "echo \"$password\" | sudo maprlogin password -user mapr"
kubectl exec -i -n dataplatform admincli-0 -- sudo /tmp/copyToMfs.sh
