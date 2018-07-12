SELECT
  decimal_18_0,
  sqlTypeOf(decimal_18_0) tOfdecimal_18_0,
  decimal_18_1,
  sqlTypeOf(decimal_18_1) tOfdecimal_18_1,
  decimal_18_4,
  sqlTypeOf(decimal_18_4) tOfdecimal_18_4,
  decimal_without_null_18_4,
  sqlTypeOf(decimal_without_null_18_4) tOfdecimal_without_null_18_4,
  decimal_with_null_18_4,
  sqlTypeOf(decimal_with_null_18_4) tOfdecimal_with_null_18_4,
  decimal_18_17,
  sqlTypeOf(decimal_18_17) tOfdecimal_18_17
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL18`;
