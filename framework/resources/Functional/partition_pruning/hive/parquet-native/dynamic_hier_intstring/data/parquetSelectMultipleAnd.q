alter session set `store.hive.optimize_scan_with_native_readers` = true;
select l_orderkey, l_partkey, l_quantity, cast(l_shipdate as date) l_shipdate, l_shipinstruct from hive.dynamic_partitions.lineitem_parquet_partitioned_hive_hier_intstring where (`year`=1993 or `month`='aug') and (`year`=1995 or `month`='dec');
alter session set `store.hive.optimize_scan_with_native_readers` = false;
