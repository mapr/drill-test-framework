select intField i, count(intField) ci, strField s, count(strField) cs from dfs.drillTestDir.`DRILL-1248/group_by_parquet` group by 1, s;
