SELECT
  typeOf(decimal_28_4 * CAST(-1.0 AS DECIMAL(28,4))) tOfc1,
  CAST(decimal_28_4 AS DECIMAL(38, 4)),
  sqlTypeOf(CAST(decimal_28_4 AS DECIMAL(38, 4)))
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`;
