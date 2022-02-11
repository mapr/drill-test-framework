
set -x

source conf/drillTestConfig.properties

cd ${DRILL_TEST_DATA_DIR}/Advanced/upgrade

cluster=$(./get_cluster)

./load_data $cluster
./setup $cluster

errors=0

./applyAndWaitForAllPods full.all.yaml

./upgradecldb $cluster 3 7200
ret=$?
if [[ $ret -gt 0 ]]
then
  echo upgrade cldb has returned error $ret
  kubectl get pods -n $cluster | grep cldb
fi

./checkcldbvalid $cluster $errors 600

./checkcldbmaster $cluster $errors 600

# checkcldbconnectzk $cluster 0 3600
checkcldbconnectzk $cluster 0 600

./upgradezk $cluster 3 10800
ret=$?
if [[ $ret -gt 0 ]]
then
  echo upgrade zk has returned error $ret
  kubectl get pods -n $cluster | grep zk
fi

# don't check cldb because cldb will be upgraded anyway
# new edf code makes sure that cldb is valid and has correct cldbstate
./checkzkmaster $cluster $errors 600
./checkcldbvalid $cluster $errors 600
./checkcldbmaster $cluster $errors 600
# checkcldbconnectzk $cluster $errors 3600
./checkcldbconnectzk $cluster $errors 600

kubectl get pods -n $cluster

./getupg $cluster admincli
./getupg $cluster cldb
./getupg $cluster collectd
./getupg $cluster dataaccessgateway
./getupg $cluster elasticsearch
./getupg $cluster fluent
./getupg $cluster grafana
./getupg $cluster hivemeta
./getupg $cluster httpfs
./getupg $cluster kafkarest
./getupg $cluster kibana
./getupg $cluster maprgateway
./getupg $cluster mcs
./getupg $cluster mfs
./getupg $cluster objectstore
./getupg $cluster opentsdb
./getupg $cluster zk

ret=$(./getupg $cluster admincli | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeAdmincli
else
  echo FAIL RUpgradeAdmincli
fi
ret=$(./getupg $cluster cldb | grep -o DEBUG | wc -l)
if [[ $ret -eq 3 ]]
then
  echo PASS RUpgradeCLDB0
  echo PASS RUpgradeCLDB1
  echo PASS RUpgradeCLDB2
else
  ret=$(./getupg $cluster cldb | grep -o "INFO\|DEBUG\|ERROR")
  first=$(echo $ret | cut -d" " -f1)
  second=$(echo $ret | cut -d" " -f2)
  third=$(echo $ret | cut -d" " -f3)
  if [[ $first == "DEBUG" ]]
  then
    echo PASS RUpgradeCLDB0
  else
    echo FAIL RUpgradeCLDB0
  fi
  if [[ $second == "DEBUG" ]]
  then
    echo PASS RUpgradeCLDB1
  else
    echo FAIL RUpgradeCLDB1
  fi
  if [[ $third == "DEBUG" ]]
  then
    echo PASS RUpgradeCLDB2
  else
    echo FAIL RUpgradeCLDB2
  fi
fi
ret=$(./getupg $cluster collectd | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeCollectd
else
  echo FAIL RUpgradeCollectd
fi
ret=$(./getupg $cluster dataaccessgateway | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeDataaccessgateway
else
  echo FAIL RUpgradeDataaccessgateway
fi
ret=$(./getupg $cluster elasticsearch | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeElasticSearch
else
  echo FAIL RUpgradeElasticSearch
fi
ret=$(./getupg $cluster fluent | grep -o DEBUG | wc -l)
if [[ $ret -eq 5 ]]
then
  echo PASS RUpgradeFluent
else
  echo FAIL RUpgradeFluent
fi
ret=$(./getupg $cluster grafana | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeGrafana
else
  echo FAIL RUpgradeGrafana
fi
ret=$(./getupg $cluster hivemeta | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeHivemeta
else
  echo FAIL RUpgradeHivemeta
fi
ret=$(./getupg $cluster httpfs | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeHttpfs
else
  echo FAIL RUpgradeHttpfs
fi
ret=$(./getupg $cluster kafkarest | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeKafkarest
else
  echo FAIL RUpgradeKafkarest
fi
ret=$(./getupg $cluster kibana | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeKibana
else
  echo FAIL RUpgradeKibana
fi
ret=$(./getupg $cluster maprgateway | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeMaprgateway
else
  echo FAIL RUpgradeMaprgateway
fi
ret=$(./getupg $cluster mcs | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeMCS
else
  echo FAIL RUpgradeMCS
fi
ret=$(./getupg $cluster mfs | grep -o DEBUG | wc -l)
if [[ $ret -eq 2 ]]
then
  echo PASS RUpgradeMFS0
  echo PASS RUpgradeMFS1
else
  ret=$(./getupg $cluster mfs | grep -o "INFO\|DEBUG\|ERROR")
  first=$(echo $ret | cut -d" " -f1)
  second=$(echo $ret | cut -d" " -f2)
  if [[ $first == "DEBUG" ]]
  then
    echo PASS RUpgradeMFS0
  else
    echo FAIL RUpgradeMFS0
  fi
  if [[ $second == "DEBUG" ]]
  then
    echo PASS RUpgradeMFS1
  else
    echo FAIL RUpgradeMFS1
  fi
fi
ret=$(./getupg $cluster objectstore | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeObjectstore
else
  echo FAIL RUpgradeObjectstore
fi
ret=$(./getupg $cluster opentsdb | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeOpentsdb
else
  echo FAIL RUpgradeOpentsdb
fi
ret=$(./getupg $cluster zk | grep -o DEBUG | wc -l)
if [[ $ret -eq 3 ]]
then
  echo PASS RUpgradeZK0
  echo PASS RUpgradeZK1
  echo PASS RUpgradeZK2
else
  ret=$(./getupg $cluster zk | grep -o "INFO\|DEBUG\|ERROR")
  first=$(echo $ret | cut -d" " -f1)
  second=$(echo $ret | cut -d" " -f2)
  third=$(echo $ret | cut -d" " -f3)
  if [[ $first == "DEBUG" ]]
  then
    echo PASS RUpgradeZK0
  else
    echo FAIL RUpgradeZK0
  fi
  if [[ $second == "DEBUG" ]]
  then
    echo PASS RUpgradeZK1
  else
    echo FAIL RUpgradeZK1
  fi
  if [[ $third == "DEBUG" ]]
  then
    echo PASS RUpgradeZK2
  else
    echo FAIL RUpgradeZK2
  fi
fi


./checklogsall $cluster admincli-0 DEBUG 3600 "ADMINCLI pod is now really ready"
# ./checklogsall $cluster cldb-0 DEBUG 3600 "CLDB pod is now really ready"
# ./checklogsall $cluster cldb-1 DEBUG 3600 "CLDB pod is now really ready"
# ./checklogsall $cluster cldb-2 DEBUG 3600 "CLDB pod is now really ready"
./checklogsall $cluster cldb-0 DEBUG 600 "CLDB pod is now really ready"
./checklogsall $cluster cldb-1 DEBUG 600 "CLDB pod is now really ready"
./checklogsall $cluster cldb-2 DEBUG 600 "CLDB pod is now really ready"
./checklogsall $cluster collectd DEBUG 600 "COLLECTD pod is now really ready"
./checklogsall $cluster dataaccessgateway-0 DEBUG 600 "DAG pod is now really ready"
./checklogsall $cluster elasticsearch-0 DEBUG 600 "ELASTICSEARCH pod is now really ready"
./checklogsall $cluster fluent DEBUG 600 "FLUENT pod is now really ready"
./checklogsall $cluster grafana DEBUG 600 "GRAFANA pod is now really ready"
./checklogsall $cluster hivemeta-0 DEBUG 600 "HIVEMETA pod is now really ready"
./checklogsall $cluster httpfs-0 DEBUG 600 "HTTPFS pod is now really ready"
./checklogsall $cluster kafkarest-0 DEBUG 600 "KAFKAREST pod is now really ready"
./checklogsall $cluster kibana DEBUG 600 "KIBANA pod is now really ready"
./checklogsall $cluster maprgateway-0 DEBUG 600 "MAPRGW pod is now really ready"
./checklogsall $cluster mcs-0 DEBUG 600 "APISERVER pod is now really ready"
./checklogsall $cluster mfs-0 DEBUG 600 "MFS pod is now really ready"
./checklogsall $cluster mfs-1 DEBUG 600 "MFS pod is now really ready"
./checklogsall $cluster objectstore-zone1-0 DEBUG 600 "OBJECTSTORE pod is now really ready"
./checklogsall $cluster opentsdb-0 DEBUG 600 "OPENTSDB pod is now really ready"
./checklogsall $cluster zk-0 DEBUG 600 "ZOOKEEPER pod is now really ready"
./checklogsall $cluster zk-1 DEBUG 600 "ZOOKEEPER pod is now really ready"
./checklogsall $cluster zk-2 DEBUG 600 "ZOOKEEPER pod is now really ready"

./taillogs.really.ready $cluster admincli
./taillogs.really.ready $cluster cldb-0
./taillogs.really.ready $cluster cldb-1
./taillogs.really.ready $cluster cldb-2
./taillogs.really.ready $cluster collectd
./taillogs.really.ready $cluster dataaccessgateway
./taillogs.really.ready $cluster elasticsearch
./taillogs.really.ready $cluster fluent
./taillogs.really.ready $cluster grafana
./taillogs.really.ready $cluster hivemeta
./taillogs.really.ready $cluster httpfs
./taillogs.really.ready $cluster kafkarest
./taillogs.really.ready $cluster kibana
./taillogs.really.ready $cluster maprgateway
./taillogs.really.ready $cluster mcs
./taillogs.really.ready $cluster mfs-0
./taillogs.really.ready $cluster mfs-1
./taillogs.really.ready $cluster objectstore
./taillogs.really.ready $cluster opentsdb
./taillogs.really.ready $cluster zk-0
./taillogs.really.ready $cluster zk-1
./taillogs.really.ready $cluster zk-2

./get_mapr_ticket_for_pod $cluster admincli
./get_mapr_ticket_for_pod $cluster cldb
./get_mapr_ticket_for_pod $cluster collectd
./get_mapr_ticket_for_pod $cluster dataaccessgateway
./get_mapr_ticket_for_pod $cluster elasticsearch
./get_mapr_ticket_for_pod $cluster fluent
./get_mapr_ticket_for_pod $cluster grafana
./get_mapr_ticket_for_pod $cluster hivemeta
./get_mapr_ticket_for_pod $cluster httpfs
./get_mapr_ticket_for_pod $cluster kafkarest
./get_mapr_ticket_for_pod $cluster kibana
./get_mapr_ticket_for_pod $cluster maprgateway
./get_mapr_ticket_for_pod $cluster mcs
./get_mapr_ticket_for_pod $cluster mfs
./get_mapr_ticket_for_pod $cluster objectstore
./get_mapr_ticket_for_pod $cluster opentsdb
./get_mapr_ticket_for_pod $cluster zk

./check_for_data $cluster admincli
./check_for_data $cluster cldb
./check_for_data $cluster collectd
./check_for_data $cluster dataaccessgateway
./check_for_data $cluster elasticsearch
./check_for_data $cluster fluent
./check_for_data $cluster grafana
./check_for_data $cluster hivemeta
./check_for_data $cluster httpfs
./check_for_data $cluster kafkarest
./check_for_data $cluster kibana
./check_for_data $cluster maprgateway
./check_for_data $cluster mcs
./check_for_data $cluster mfs
./check_for_data $cluster objectstore
./check_for_data $cluster opentsdb
./check_for_data $cluster zk

date

exit $errors
