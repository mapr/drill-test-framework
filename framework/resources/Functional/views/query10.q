create or replace view v10 as select pageRank a, pageURL b, avgDuration c from `dfs/parquet/rankings`;
select a, b, c from v10;
drop view v10;
