alter session set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.hive_native.fewtypes_null_hive order by coalesce(bool_col, false), float_col nulls first limit 10;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
