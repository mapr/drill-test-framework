alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/repeated_values.parquet`;
alter session set `store.parquet.use_new_reader`= false;
