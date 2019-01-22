drop table if exists dfs.drillTestDir.`DRILL-1248/group_by_parquet`;
create table dfs.drillTestDir.`DRILL-1248/group_by_parquet`
as select cast(columns[0] as int) id, cast(columns[1] as int) intField, columns[2] strField, cast(columns[3] as double) doubleField
from dfs.drillTestDir.`DRILL-1248/group_by.tsv`;
