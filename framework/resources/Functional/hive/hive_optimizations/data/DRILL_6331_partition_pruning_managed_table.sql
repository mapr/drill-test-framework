set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.`DRILL_6331_managed_table` where part_col in ('Partition_three', 'Partition_one');
reset `store.hive.optimize_scan_with_native_readers`;
