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
from hive.fewtypes_null_compressed_rc_snappy;
