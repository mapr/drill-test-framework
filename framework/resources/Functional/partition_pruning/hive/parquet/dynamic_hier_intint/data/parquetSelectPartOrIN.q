select l_orderkey, l_partkey, l_quantity, cast(l_shipdate as date) l_shipdate, l_shipinstruct from hive.dynamic_partitions.lineitem_parquet_partitioned_hive_hier_intint where (`year` IN (1993) and l_orderkey>29600) or `month` IN (12);