alter session set `store.hive.optimize_scan_with_native_readers` = true;
select count(*) from (select case when date_col is null then date '2014-01-02' else date'2014-01-01' end dt from hive.hive_native.fewtypes_null_hive) d group by d.dt;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
