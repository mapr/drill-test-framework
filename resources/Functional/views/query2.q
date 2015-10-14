create or replace view v2 as select * from `dfs/parquet/rankings`;
select pageRank from v2;
drop view v2;
