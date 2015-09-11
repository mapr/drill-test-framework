create table dfs.ctas_flatten.alltypes1_ctas as select flatten(rep_map) from `alltypes-repeated.parquet`;
select * from dfs.ctas_flatten.alltypes1_ctas;
select 1 from sys.options;
