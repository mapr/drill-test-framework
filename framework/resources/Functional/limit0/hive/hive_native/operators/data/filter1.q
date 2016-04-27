alter session set `store.hive.optimize_scan_with_native_readers` = true;
select count(*) from hive.hive_native.fewtypes_null_hive where cast(interval_col as interval day) is null;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
