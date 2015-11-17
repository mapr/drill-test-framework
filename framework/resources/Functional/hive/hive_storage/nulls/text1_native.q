alter session set `store.hive.optimize_scan_with_native_readers` = true;
select * from hive.null_schemachange;
select 1 from sys.options;
