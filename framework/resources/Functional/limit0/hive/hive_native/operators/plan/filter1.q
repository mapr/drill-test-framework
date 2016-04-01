alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from (select count(*) from hive.hive_native.fewtypes_null_hive where cast(interval_col as interval day) is null) t limit 0;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
