create or replace view v7 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
select pageRank, pageURL, avgDuration from v7;
drop view v7;
