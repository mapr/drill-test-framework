create or replace view v11_limit0 as select cast(pageRank as int) pageRank , max(cast(avgDuration as integer)) maxDuration from `dfs/parquet/rankings` group by pageRank;
select pageRank, maxDuration+4 from v11_limit0;
drop view v11_limit0;
