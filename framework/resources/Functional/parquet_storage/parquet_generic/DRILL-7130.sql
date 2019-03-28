SELECT
  CHAR_LENGTH(var100field) AS column_len,
  COUNT(*) AS num_rows
FROM
  dfs.drillTestDir.`DRILL-7130/VarLenNullableFixedEntry.parquet`
GROUP BY column_len;