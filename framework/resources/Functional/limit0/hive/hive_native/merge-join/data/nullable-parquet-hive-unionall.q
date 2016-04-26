alter session set `planner.enable_hashjoin` = false;
alter session set `store.hive.optimize_scan_with_native_readers` = true;
select
    p.int_col, p.bigint_col, p.date_col, p.time_col, p.timestamp_col, p.interval_col, p.varchar_col, p.float_col, p.double_col, p.bool_col
from dfs.`cross-sources`.`fewtypes_null.parquet` p
union all  
select o.int_col, o.bigint_col, o.date_col, cast(o.time_col as time), o.timestamp_col, o.interval_col, o.varchar_col, o.float_col, o.double_col, o.bool_col
from hive.hive_native.fewtypes_null_hive o;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
alter session set `planner.enable_hashjoin` = true;
