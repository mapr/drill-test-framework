alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/multiple_rowgroups.parquet`;
alter session set `store.parquet.use_new_reader`= false;
