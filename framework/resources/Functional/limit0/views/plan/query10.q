create or replace view v10_limit0_plan as select cast(pageRank as int) a, cast(pageURL as varchar(100)) b, cast(avgDuration as integer) c from `dfs/parquet/rankings`;
explain plan for select * from (select  a, b, c from v10_limit0_plan) t limit 0;
drop view v10_limit0_plan;
