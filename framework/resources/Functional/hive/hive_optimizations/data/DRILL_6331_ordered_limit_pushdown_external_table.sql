set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.`DRILL_6331_external_table` order by id desc limit 2;
reset `store.hive.optimize_scan_with_native_readers`;
