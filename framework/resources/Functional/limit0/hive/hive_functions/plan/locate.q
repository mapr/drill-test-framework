explain plan for select * from (
select locate('df', varchar_col, 5) from hive.hive_storage.fewtypes_null_parquet) t limit 0;
