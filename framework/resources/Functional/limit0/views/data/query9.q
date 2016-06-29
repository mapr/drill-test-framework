create or replace view v9_limit0 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
select pageRank, count(*) from v9_limit0 group by pageRank;
drop view v9_limit0;
