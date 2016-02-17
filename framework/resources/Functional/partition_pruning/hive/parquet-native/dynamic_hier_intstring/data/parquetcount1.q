alter session set `store.hive.optimize_scan_with_native_readers` = true;
select count(*) from hive.dynamic_partitions.lineitem_parquet_partitioned_hive_hier_intstring;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
