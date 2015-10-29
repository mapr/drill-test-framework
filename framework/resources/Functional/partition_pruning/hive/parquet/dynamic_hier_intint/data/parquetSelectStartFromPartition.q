select * from hive.dynamic_partitions.lineitem_parquet_partitioned_hive_hier_intint where (`year`=1993 and l_orderkey>29600) or (`year`=1994 and l_orderkey>29700);
