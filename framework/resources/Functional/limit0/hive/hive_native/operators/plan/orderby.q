alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from (select * from hive.hive_native.fewtypes_null_hive order by coalesce(bool_col, false), float_col nulls first limit 10) t limit 0;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
