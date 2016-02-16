alter session set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.lineitem_parquet_partitioned_hive_string where (`year`='1993' and l_orderkey>29600) or (`year`='1994' and l_orderkey>29700);
alter session set `store.hive.optimize_scan_with_native_readers` = false;
