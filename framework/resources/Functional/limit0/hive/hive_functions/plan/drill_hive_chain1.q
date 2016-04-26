explain plan for select * from (
select char_length(if(`year`(l_shipdate) > 2000, 'latest', 'old')) from hive.tpch01_parquet_nodate.lineitem order by l_orderkey limit 1) t limit 0;
