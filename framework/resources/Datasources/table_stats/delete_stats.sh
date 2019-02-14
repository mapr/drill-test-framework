#!/bin/bash
source conf/drillTestConfig.properties
set -x
hadoop fs -test -d /drill/testdata/table_stats/alltypes_with_nulls/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/alltypes_with_nulls/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/date_intervals/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/date_intervals/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/impala_parquet/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/impala_parquet/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/onlynulls_parquet/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/onlynulls_parquet/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/DRILL-4735/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/DRILL-4735/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/inNstedDirAutoPrtn/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/inNstedDirAutoPrtn/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/lineitem_parquet_partitioned_hive_date/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/lineitem_parquet_partitioned_hive_date/.stats.drill
fi
hadoop fs -test -f /drill/testdata/table_stats/lineitem_parquet_partitioned_hive_date/.drill.parquet_metadata*
if [ $? -eq 0 ]; then
   hadoop fs -rm /drill/testdata/table_stats/lineitem_parquet_partitioned_hive_date/.drill.parquet_metadata*
fi
hadoop fs -test -d /drill/testdata/table_stats/parquet_alltypes1/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/parquet_alltypes1/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/parquet_alot_nulls/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/parquet_alot_nulls/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/parquet_col_empty/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/parquet_col_empty/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/parquet_col_nulls/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/parquet_col_nulls/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/ps_5level/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/ps_5level/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/spark_generated/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/spark_generated/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/voter_hive_parquet/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/voter_hive_parquet/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/hive_alltypes/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/hive_alltypes/.stats.drill
fi
hadoop fs -test -d /drill/testdata/table_stats/data_with_0/.stats.drill
if [ $? -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/table_stats/data_with_0/.stats.drill
fi