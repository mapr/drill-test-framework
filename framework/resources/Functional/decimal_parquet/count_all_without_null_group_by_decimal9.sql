SELECT
  COUNT(ALL decimal_without_null_9_4)
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL9`
GROUP BY decimal_without_null_9_4;
