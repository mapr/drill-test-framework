alter session set `store.parquet.use_new_reader`= true;
select one,two,three from `parquet_storage/chars-formats.parquet`;
alter session set `store.parquet.use_new_reader`= false;
