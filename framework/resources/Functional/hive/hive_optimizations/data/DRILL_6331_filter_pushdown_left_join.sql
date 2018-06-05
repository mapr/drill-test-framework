set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.`DRILL_6331_managed_table` mt left join hive.`DRILL_6331_external_empty_table` et on mt.id = et.id where mt.date_col < '2017-01-01' and et.float_col is null;
reset `store.hive.optimize_scan_with_native_readers`;
