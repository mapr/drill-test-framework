create table my_dec_table as select *, cast(o_totalprice as decimal(10,2)) dec1, cast(o_totalprice as decimal(10,2)) dec2 from cp.`tpch/orders.parquet`;
select * from my_dec_table;
select 1 from sys.version;
