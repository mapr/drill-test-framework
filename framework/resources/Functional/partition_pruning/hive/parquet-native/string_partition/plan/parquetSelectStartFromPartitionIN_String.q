alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from hive.lineitem_parquet_partitioned_hive_string where (`year` IN ('1993') and l_orderkey>29600) or (`year` IN ('1994') and l_orderkey>29700);
alter session set `store.hive.optimize_scan_with_native_readers` = false;
