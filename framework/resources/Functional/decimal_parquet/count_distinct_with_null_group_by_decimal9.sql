SELECT
  COUNT(DISTINCT decimal_with_null_9_4)
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL9`
GROUP BY decimal_with_null_9_4;
