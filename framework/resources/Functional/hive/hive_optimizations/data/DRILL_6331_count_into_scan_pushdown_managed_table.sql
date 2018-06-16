set `store.hive.optimize_scan_with_native_readers` = true;
select count(float_col) from hive.`DRILL_6331_managed_table`;
reset `store.hive.optimize_scan_with_native_readers`;
