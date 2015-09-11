create or replace view v9 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageRank, count(*) from v9 group by pageRank;
drop view v9;
