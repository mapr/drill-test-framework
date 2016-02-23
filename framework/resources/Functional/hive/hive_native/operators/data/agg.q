alter session set `store.hive.optimize_scan_with_native_readers` = true;
select 
  sum(int_col), 
  max(bigint_col), 
  min(time_col), 
  min(timestamp_col), 
  min(date_sub(date_col, 365)), 
  min(length(varchar_col)), 
  avg(float_col/double_col), 
  sum(case when bool_col=true then 1 else 0 end), 
  count( distinct nvl(bool_col, false)) 
from hive.hive_native.fewtypes_null_hive;
alter session set `store.hive.optimize_scan_with_native_readers` = false;
