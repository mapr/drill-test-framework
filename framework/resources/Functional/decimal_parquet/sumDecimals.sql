SELECT
  SUM(decimal_28_4) sum_decimals
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`
GROUP BY id_int;
