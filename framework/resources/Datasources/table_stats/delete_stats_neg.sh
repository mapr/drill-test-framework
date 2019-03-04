#!/bin/bash
source conf/drillTestConfig.properties
set -x
hadoop fs -test -d /drill/testdata/table_stats/voter_pig/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/voter_pig/.stats.drill
fi