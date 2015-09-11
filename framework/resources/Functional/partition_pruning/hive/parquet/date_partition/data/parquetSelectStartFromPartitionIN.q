select * from hive.lineitem_parquet_partitioned_hive_date where (dt IN (date '2014-10-22') and l_orderkey>29600) or (dt IN (date '2014-10-23') and l_orderkey>29700);
