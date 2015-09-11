create or replace view v1_describe1 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
describe v1_describe1;
drop view v1_describe1;
