create table time_parquet as select cast(columns[0] as time) time_col from dfs.ctas.`time.tbl`;
select * from time_parquet;
drop table time_parquet;
