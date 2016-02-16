alter session set `store.hive.optimize_scan_with_native_readers` = true;
select c1, c2, c3, c4, c9, c10, c11 c12, c19, c20 from hive.hive_native.drill_supported_hivetypes;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
