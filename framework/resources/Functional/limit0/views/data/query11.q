create or replace view v11 as select cast(pageRank as int) pageRank , max(cast(avgDuration as integer)) maxDuration from `dfs/parquet/rankings` group by pageRank;
select pageRank, maxDuration+4 from v11;
drop view v11;
