create or replace view v3 as select * from `dfs/parquet/rankings`;
select pageRank, pageURL, avgDuration from v3;
drop view v3;
