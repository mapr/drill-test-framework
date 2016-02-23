alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select count(*) from hive.orders_parquet_partitioned_hive o, hive.lineitem_parquet_partitioned_hive l where o.o_orderkey = l.l_orderkey and o.`year`=1992 and l.`year`=1993;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
