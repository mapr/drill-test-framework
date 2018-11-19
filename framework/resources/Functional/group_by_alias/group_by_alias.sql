select intField i, count(intField) ci from dfs.drillTestDir.`DRILL-1248/group_by_parquet` group by i;
