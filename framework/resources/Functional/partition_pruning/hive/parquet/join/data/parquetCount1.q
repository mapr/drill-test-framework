select count(*) from hive.orders_parquet_partitioned_hive o, hive.lineitem_parquet_partitioned_hive l where o.o_orderkey = l.l_orderkey;
