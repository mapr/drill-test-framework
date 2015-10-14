alter session set `store.parquet.use_new_reader`= true;
select * from `parquet_storage/long_page_header.parquet`;
alter session set `store.parquet.use_new_reader`= false;
