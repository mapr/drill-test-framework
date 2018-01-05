select sum(ts), sum(dr), count(ui), sum(up) from dfs_test.`/drill/testdata/parquet_storage/DRILL-4759.gz.parquet`
