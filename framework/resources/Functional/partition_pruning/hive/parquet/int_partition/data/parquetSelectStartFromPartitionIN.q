select * from hive.lineitem_parquet_partitioned_hive where (`year` IN (1993) and l_orderkey>29600) or (`year` IN (1994) and l_orderkey>29700);
