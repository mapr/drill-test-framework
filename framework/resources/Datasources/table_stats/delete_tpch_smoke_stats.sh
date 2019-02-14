#!/bin/bash
source conf/drillTestConfig.properties

set -x

hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/customer/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/customer/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/lineitem/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/lineitem/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/nation/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/nation/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/orders/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/orders/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/part/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/part/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/partsupp/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/partsupp/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/region/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/region/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/tpch-multi/supplier/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/tpch-multi/supplier/.stats.drill
fi