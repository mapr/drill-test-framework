alter session set `store.hive.optimize_scan_with_native_readers` = true;
explain plan for select * from (select sum(s.`sum`), s.c2_derived from (select c1+c3+c9+10+11+12 `sum`, case when c2 is true then 1 else 0 end c2_derived from hive.hive_native.drill_supported_hivetypes) s group by c2_derived) t limit 0;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
