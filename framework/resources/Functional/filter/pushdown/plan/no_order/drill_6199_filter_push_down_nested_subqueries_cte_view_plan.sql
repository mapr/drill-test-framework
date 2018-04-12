explain plan for
with t as (select * from dfs.drillTestDir.`DRILL_6118_parquet_partitioned_by_folders_view`)
select * from (select * from (select * from t)) where c1 = 3;