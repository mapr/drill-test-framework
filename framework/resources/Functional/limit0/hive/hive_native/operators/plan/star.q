alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from (select * from hive.hive_native.fewtypes_null_hive) t limit 0;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
