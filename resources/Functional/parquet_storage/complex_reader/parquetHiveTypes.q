alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/hive_alltypes.parquet`;
alter session set `store.parquet.use_new_reader`= false;
