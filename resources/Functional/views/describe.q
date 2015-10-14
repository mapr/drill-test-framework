create or replace view v1_describe as select * from `dfs/parquet/rankings`;
describe v1_describe;
drop view v1_describe;
