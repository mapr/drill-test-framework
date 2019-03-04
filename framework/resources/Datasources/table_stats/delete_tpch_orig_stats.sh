#!/bin/bash
source conf/drillTestConfig.properties

set -x

hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/customer/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/customer/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/lineitem/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/lineitem/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/nation/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/nation/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/orders/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/orders/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/part/.stats.drill
if [ $dirExists_tpch_part -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/part/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/partsupp/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/partsupp/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/region/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/region/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/Tpch0.01/parquet/supplier/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/Tpch0.01/parquet/supplier/.stats.drill
fi

