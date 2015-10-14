create or replace view v6 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
select pageURL from `v6.view.drill`;
drop view v6;
