alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select l_orderkey, l_partkey, l_quantity, cast(l_shipdate as date) l_shipdate, l_shipinstruct from hive.dynamic_partitions.lineitem_parquet_partitioned_hive_hier_intstring where (`year`=1993 and `month`='dec' and l_orderkey>29600) or `year`=1994;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
