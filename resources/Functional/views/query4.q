create or replace view v4 as select * from `dfs/parquet/rankings`;
select * from v4;
drop view v4;
