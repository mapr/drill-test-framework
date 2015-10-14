alter session set `store.parquet.use_new_reader`= true;
select c1,c3,c4,c6 from `parquet_storage/hive_alltypes.parquet`;
alter session set `store.parquet.use_new_reader`= false;
