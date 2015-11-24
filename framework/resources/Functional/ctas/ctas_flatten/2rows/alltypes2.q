create table dfs.ctas_flatten.alltypes2_ctas as select flatten(rep_map) from `alltypes-repeated.json`;
select * from dfs.ctas_flatten.alltypes2_ctas;
drop table dfs.ctas_flatten.alltypes2_ctas;
