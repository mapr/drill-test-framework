alter session set `planner.slice_target`=1;
select cast(cast(bool_col as varchar(100)) as boolean) from dfs.`/drill/testdata/cross-sources/fewtypes_null.parquet`;
alter session set `planner.slice_target`=100000;
