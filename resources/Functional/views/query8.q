create or replace view v8 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select * from v8;
drop view v8;
