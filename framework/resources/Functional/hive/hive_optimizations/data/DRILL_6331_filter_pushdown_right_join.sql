set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.`DRILL_6331_managed_empty_table` mt right join hive.`DRILL_6331_external_table` et on mt.id = et.id where et.float_col > 2;
reset `store.hive.optimize_scan_with_native_readers`;
