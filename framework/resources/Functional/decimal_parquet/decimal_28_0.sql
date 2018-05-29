SELECT
  decimal_28_0,
  sqlTypeOf(decimal_28_0) tOfdecimal_28_0,
  decimal_28_1,
  sqlTypeOf(decimal_28_1) tOfdecimal_28_1,
  decimal_28_4,
  sqlTypeOf(decimal_28_4) tOfdecimal_28_4,
  decimal_without_null_28_4,
  sqlTypeOf(decimal_without_null_28_4) tOfdecimal_without_null_28_4,
  decimal_with_null_28_4,
  sqlTypeOf(decimal_with_null_28_4) tOfdecimal_with_null_28_4,
  decimal_28_27,
  sqlTypeOf(decimal_28_27) tOfdecimal_28_27
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`;
