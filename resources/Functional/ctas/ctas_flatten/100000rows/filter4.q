create table dfs.ctas_flatten.`filter4_100000rows_ctas` as select uid_str, flatten(events) from `data.json` where uid_str = '01';
select * from dfs.ctas_flatten.`filter4_100000rows_ctas`;
select 1 from sys.options;
