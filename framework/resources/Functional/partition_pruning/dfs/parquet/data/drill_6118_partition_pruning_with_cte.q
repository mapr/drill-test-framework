with DRILL_6118_parquet_partitioned_by_files_cte as (select * from dfs.drillTestDir.`DRILL_6118_parquet_partitioned_by_files`)
select c3 from DRILL_6118_parquet_partitioned_by_files_cte where c1<3;