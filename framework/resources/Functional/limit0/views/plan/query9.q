create or replace view v9_limit0_plan as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select pageRank, count(*) from v9_limit0_plan group by pageRank) t limit 0;
drop view v9_limit0_plan;
