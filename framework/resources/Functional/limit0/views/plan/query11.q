create or replace view v11_limit0_plan as select cast(pageRank as int) pageRank , max(cast(avgDuration as integer)) maxDuration from `dfs/parquet/rankings` group by pageRank;
explain plan for select * from (select pageRank, maxDuration+4 from v11_limit0_plan ) t limit 0;
drop view v11_limit0_plan;
