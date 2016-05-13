#!/bin/bash
source conf/drillTestConfig.properties

set -x

hadoop fs -test -d /drill/testdata/text_storage/drill-4484/20160401/3
dirExists_0401_3=$?
if [ $dirExists_0401_3 -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/text_storage/drill-4484/20160401/3
fi
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160401/3

hadoop fs -test -d /drill/testdata/text_storage/drill-4484/20160404
dirExists_0404=$?
if [ $dirExists_0404 -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/text_storage/drill-4484/20160404
fi
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160404

hadoop fs -test -d /drill/testdata/text_storage/drill-4484/20160501
dirExists_0501=$?
if [ $dirExists_0501 -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/text_storage/drill-4484/20160501
fi
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160501
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160501/1
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160501/2

hadoop fs -test -d /drill/testdata/text_storage/drill-4484/20160502
dirExists_0502=$?
if [ $dirExists_0502 -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/text_storage/drill-4484/20160502
fi
hadoop fs -mkdir /drill/testdata/text_storage/drill-4484/20160502

set +x
