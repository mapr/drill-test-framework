# 
# THIS SCRIPT IS NOT USED ANYWHERE IN OUR FUNCTIONAL TESTS
# THIS IS JUST CHECKED IN SO THAT WE HAVE A REFERENCE AS TO HOW WE GENERATED THE DATA
#
create table dfs_test.drillTestDir.drillgen_fewtypes_null_hive as 
select 
  int_col, 
  bigint_col, 
  cast(date_col as varchar(100)) date_col, 
  time_col, 
  cast(timestamp_col as timestamp) timestamp_col, 
  interval_col, 
  varchar_col, 
  float_col, 
  double_col, 
  bool_col 
from fewtypes_null_hive;
