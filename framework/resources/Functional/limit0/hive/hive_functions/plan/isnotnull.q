explain plan for select * from (
select isnotnull(timestamp_col) from hive.crosssources.fewtypes_null_hive) t limit 0;
