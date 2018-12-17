create table if not exists dfs.drillTestDir.`filter/pushdown/DRILL_6118_parquet_partitioned_by_files` (c1, c2, c3, c4, c5)
partition by (c1) as
select cast(columns[0] as int) c1, columns[1] c2, columns[2] c3, columns[3] c4, columns[4] c5
from dfs.drillTestDir.`filter/pushdown/DRILL_6118_data_source.csv`;

create view if not exists dfs.drillTestDir.`filter/pushdown/DRILL_6118_parquet_partitioned_by_files_view` as
select *
from dfs.drillTestDir.`filter/pushdown/DRILL_6118_parquet_partitioned_by_files`;