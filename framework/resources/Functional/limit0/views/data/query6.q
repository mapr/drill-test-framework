create or replace view v6_limit0 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
select pageURL from `v6_limit0.view.drill`;
drop view v6_limit0;
