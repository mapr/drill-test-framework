explain plan for select * from (
select if(`year`(l_shipdate) > 2000, 'latest', 'old') from hive.tpch01_parquet_nodate.lineitem) t limit 0;
