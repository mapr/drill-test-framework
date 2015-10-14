create or replace view v1 as select * from `dfs/parquet/rankings`;
select count(*) from v1;
drop view v1;
