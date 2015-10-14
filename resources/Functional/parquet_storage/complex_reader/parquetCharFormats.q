alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/chars-formats.parquet`;
alter session set `store.parquet.use_new_reader`= false;
