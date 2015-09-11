create or replace view v5 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select count(*) from v5;
drop view v5;
