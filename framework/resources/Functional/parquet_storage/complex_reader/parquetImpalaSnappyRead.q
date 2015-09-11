alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/customer_snappyimpala.parquet`;
alter session set `store.parquet.use_new_reader`= false;
