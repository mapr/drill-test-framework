alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from (select c1, c2, c3, c4, c9, c10, c11 c12, c19, c20 from hive.hive_native.drill_supported_hivetypes) t limit 0;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
