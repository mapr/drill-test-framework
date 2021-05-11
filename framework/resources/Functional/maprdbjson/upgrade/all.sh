
set -x

cd framework/resources/Functional/upgrade/

./load_data
./setup

errors=0

./applyAndWaitForAllPods full.all.yaml

./upgradecldb 3 7200
ret=$?
if [[ $ret -gt 0 ]]
then
  echo upgrade cldb has returned error $ret
  kubectl get pods -n dataplatform | grep cldb
  # exit $ret
fi

./checkcldbvalid $errors 600

./checkcldbmaster $errors 600

# checkcldbconnectzk 0 3600
checkcldbconnectzk 0 600

./upgradezk 3 10800
ret=$?
if [[ $ret -gt 0 ]]
then
  echo upgrade zk has returned error $ret
  kubectl get pods -n dataplatform | grep zk
  # exit $ret
fi

# don't check cldb because cldb will be upgraded anyway
# new edf code makes sure that cldb is valid and has correct cldbstate
./checkzkmaster $errors 600
./checkcldbvalid $errors 600
./checkcldbmaster $errors 600
# checkcldbconnectzk $errors 3600
./checkcldbconnectzk $errors 600

./getupg admincli
./getupg cldb
./getupg collectd
./getupg elasticsearch
./getupg fluent
./getupg grafana
./getupg hivemeta
./getupg httpfs
./getupg kibana
./getupg mcs
./getupg mfs
./getupg objectstore
./getupg opentsdb
./getupg zk

ret=$(./getupg admincli | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeAdmincli
else
  echo FAIL RUpgradeAdmincli
fi
ret=$(./getupg cldb | grep -o DEBUG | wc -l)
if [[ $ret -eq 3 ]]
then
  echo PASS RUpgradeCLDB0
  echo PASS RUpgradeCLDB1
  echo PASS RUpgradeCLDB2
else
  ret=$(./getupg cldb | grep -o "INFO\|DEBUG\|ERROR")
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
ret=$(./getupg collectd | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeCollectd
else
  echo FAIL RUpgradeCollectd
fi
ret=$(./getupg elasticsearch | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeElasticSearch
else
  echo FAIL RUpgradeElasticSearch
fi
ret=$(./getupg fluent | grep -o DEBUG | wc -l)
if [[ $ret -eq 5 ]]
then
  echo PASS RUpgradeFluent
else
  echo FAIL RUpgradeFluent
fi
ret=$(./getupg grafana | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeGrafana
else
  echo FAIL RUpgradeGrafana
fi
ret=$(./getupg hivemeta | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeHivemeta
else
  echo FAIL RUpgradeHivemeta
fi
ret=$(./getupg httpfs | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeHttpfs
else
  echo FAIL RUpgradeHttpfs
fi
ret=$(./getupg kibana | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeKibana
else
  echo FAIL RUpgradeKibana
fi
ret=$(./getupg mcs | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeMCS
else
  echo FAIL RUpgradeMCS
fi
ret=$(./getupg mfs | grep -o DEBUG | wc -l)
if [[ $ret -eq 2 ]]
then
  echo PASS RUpgradeMFS0
  echo PASS RUpgradeMFS1
else
  ret=$(./getupg mfs | grep -o "INFO\|DEBUG\|ERROR")
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
ret=$(./getupg objectstore | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeObjectstore
else
  echo FAIL RUpgradeObjectstore
fi
ret=$(./getupg opentsdb | grep -o DEBUG | wc -l)
if [[ $ret -eq 1 ]]
then
  echo PASS RUpgradeOpentsdb
else
  echo FAIL RUpgradeOpentsdb
fi
ret=$(./getupg zk | grep -o DEBUG | wc -l)
if [[ $ret -eq 3 ]]
then
  echo PASS RUpgradeZK0
  echo PASS RUpgradeZK1
  echo PASS RUpgradeZK2
else
  ret=$(./getupg zk | grep -o "INFO\|DEBUG\|ERROR")
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


./checklogsall admincli-0 DEBUG 3600 "ADMINCLI pod is now really ready"
# ./checklogsall cldb-0 DEBUG 3600 "CLDB pod is now really ready"
# ./checklogsall cldb-1 DEBUG 3600 "CLDB pod is now really ready"
# ./checklogsall cldb-2 DEBUG 3600 "CLDB pod is now really ready"
./checklogsall cldb-0 DEBUG 600 "CLDB pod is now really ready"
./checklogsall cldb-1 DEBUG 600 "CLDB pod is now really ready"
./checklogsall cldb-2 DEBUG 600 "CLDB pod is now really ready"
./checklogsall collectd DEBUG 600 "COLLECTD pod is now really ready"
./checklogsall elasticsearch-0 DEBUG 600 "ELASTICSEARCH pod is now really ready"
./checklogsall fluent DEBUG 600 "FLUENT pod is now really ready"
./checklogsall grafana DEBUG 600 "GRAFANA pod is now really ready"
./checklogsall hivemeta-0 DEBUG 600 "HIVEMETA pod is now really ready"
./checklogsall httpfs-0 DEBUG 600 "HTTPFS pod is now really ready"
./checklogsall kibana DEBUG 600 "KIBANA pod is now really ready"
./checklogsall mcs-0 DEBUG 600 "APISERVER pod is now really ready"
./checklogsall mfs-group1-0 DEBUG 600 "MFS pod is now really ready"
./checklogsall mfs-group2-0 DEBUG 600 "MFS pod is now really ready"
./checklogsall objectstore-zone1-0 DEBUG 600 "OBJECTSTORE pod is now really ready"
./checklogsall opentsdb-0 DEBUG 600 "OPENTSDB pod is now really ready"
./checklogsall zk-0 DEBUG 600 "ZOOKEEPER pod is now really ready"
./checklogsall zk-1 DEBUG 600 "ZOOKEEPER pod is now really ready"
./checklogsall zk-2 DEBUG 600 "ZOOKEEPER pod is now really ready"

./taillogs.really.ready admincli
./taillogs.really.ready cldb-0
./taillogs.really.ready cldb-1
./taillogs.really.ready cldb-2
./taillogs.really.ready collectd
./taillogs.really.ready elasticsearch
./taillogs.really.ready fluent
./taillogs.really.ready grafana
./taillogs.really.ready hivemeta
./taillogs.really.ready httpfs
./taillogs.really.ready kibana
./taillogs.really.ready mcs
./taillogs.really.ready mfs-group1-0
./taillogs.really.ready mfs-group2-0
./taillogs.really.ready objectstore
./taillogs.really.ready opentsdb
./taillogs.really.ready zk-0
./taillogs.really.ready zk-1
./taillogs.really.ready zk-2

./get_mapr_ticket admincli
./get_mapr_ticket cldb
./get_mapr_ticket collectd
./get_mapr_ticket elasticsearch
./get_mapr_ticket fluent
./get_mapr_ticket grafana
./get_mapr_ticket hivemeta
./get_mapr_ticket httpfs
./get_mapr_ticket kibana
./get_mapr_ticket mcs
./get_mapr_ticket mfs
./get_mapr_ticket objectstore
./get_mapr_ticket opentsdb
./get_mapr_ticket zk

./check_for_data admincli
./check_for_data cldb
./check_for_data collectd
./check_for_data elasticsearch
./check_for_data fluent
./check_for_data grafana
./check_for_data hivemeta
./check_for_data httpfs
./check_for_data kibana
./check_for_data mcs
./check_for_data mfs
./check_for_data objectstore
./check_for_data opentsdb
./check_for_data zk

date

exit $errors

