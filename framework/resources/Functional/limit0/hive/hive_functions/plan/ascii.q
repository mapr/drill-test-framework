explain plan for select * from (
select ascii(varchar_col) from hive.crosssources.fewtypes_null_hive) t limit 0;
