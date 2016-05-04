create or replace view v2_limit0 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
select pageRank from v2_limit0;
drop view v2_limit0;
