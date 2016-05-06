create or replace view v1_limit0 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
select count(*) from v1_limit0;
drop view v1_limit0;
