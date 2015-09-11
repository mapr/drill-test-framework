alter session set `store.parquet.use_new_reader`= true;
select cust_key,acctbal,address from `parquet_storage/customer_nonull.parquet`;
alter session set `store.parquet.use_new_reader`= false;
