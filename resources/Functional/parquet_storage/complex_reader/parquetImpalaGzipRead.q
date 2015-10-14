alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/nation_gzip.impala.parquet`;
alter session set `store.parquet.use_new_reader`= false;
