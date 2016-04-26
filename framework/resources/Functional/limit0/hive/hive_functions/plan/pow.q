explain plan for select * from (
select pow(l_quantity, l_discount) from hive.tpch01_parquet_nodate.lineitem) t limit 0;
