set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.`DRILL_6331_external_table` where int_col between 0 and 5;
reset `store.hive.optimize_scan_with_native_readers`;
