alter session set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.hive_native.fewtypes_null_hive where coalesce(cast(date_col as date), date '2015-01-01', cast(date_col as date)) > date '2014-12-31';
alter session set `store.hive.optimize_scan_with_native_readers` = false;
