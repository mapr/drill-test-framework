explain plan for select l_orderkey, l_partkey, l_quantity, cast(l_shipdate as date) l_shipdate, l_shipinstruct from hive.dynamic_partitions.lineitem_parquet_partitioned_hive where `year` IN (1993);
