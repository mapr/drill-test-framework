create or replace view v6 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select pageURL from `v6.view.drill`) t limit 0;
drop view v6;
