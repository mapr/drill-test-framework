select c1, count(*) from (select * from dfs.drillTestDir.`filter/pushdown/DRILL_6118_parquet_partitioned_by_files`) where c1 between 2 and 4 group by c1