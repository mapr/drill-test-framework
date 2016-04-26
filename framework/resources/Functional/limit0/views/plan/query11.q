create or replace view v11 as select cast(pageRank as int) pageRank , max(cast(avgDuration as integer)) maxDuration from `dfs/parquet/rankings` group by pageRank;
explain plan for select * from (select pageRank, maxDuration+4 from v11) t limit 0;
drop view v11;
