create or replace view v9 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select pageRank, count(*) from v9 group by pageRank) t limit 0;
drop view v9;
