create or replace view v7 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageRank, pageURL, avgDuration from v7;
drop view v7;
