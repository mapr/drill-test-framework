create or replace view v3 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select pageRank, pageURL, avgDuration from v3) t limit 0;
drop view v3;
