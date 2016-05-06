create or replace view v10_limit0 as select cast(pageRank as int) a, cast(pageURL as varchar(100)) b, cast(avgDuration as integer) c from `dfs/parquet/rankings`;
select a, b, c from v10_limit0;
drop view v10_limit0;
