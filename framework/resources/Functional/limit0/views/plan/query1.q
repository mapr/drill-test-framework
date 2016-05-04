create or replace view v1_limit0_plan as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select count(*) from v1_limit0_plan) t limit 0;
drop view v1_limit0_plan;
