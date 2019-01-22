select intField i, count(intField) ci, strField s, count(strField) cs from dfs.drillTestDir.`DRILL-1248/group_by_parquet` group by i, 3 having ci > 1;
