SELECT
  decimal_9_0,
  sqlTypeOf(decimal_9_0) tOfdecimal_9_0,
  decimal_9_1,
  sqlTypeOf(decimal_9_1) tOfdecimal_9_1,
  decimal_9_4,
  sqlTypeOf(decimal_9_4) tOfdecimal_9_4,
  decimal_without_null_9_4,
  sqlTypeOf(decimal_without_null_9_4) tOfdecimal_without_null_9_4,
  decimal_with_null_9_4,
  sqlTypeOf(decimal_with_null_9_4) tOfdecimal_with_null_9_4,
  decimal_9_8,
  sqlTypeOf(decimal_9_8) tOfdecimal_9_8
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL9`;
