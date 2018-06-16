set `store.hive.optimize_scan_with_native_readers` = true;
select * from (select * from hive.`DRILL_6331_managed_table`) where date_col is null;
reset `store.hive.optimize_scan_with_native_readers`;
