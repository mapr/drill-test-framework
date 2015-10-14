alter session set `store.parquet.use_new_reader`= true;
select L_ORDERKEY,L_PARTKEY,L_TAX from `parquet_storage/tpch-multi/lineitem`;
alter session set `store.parquet.use_new_reader`= false;
