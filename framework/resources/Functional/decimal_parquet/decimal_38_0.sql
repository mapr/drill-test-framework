SELECT
  decimal_38_0,
  sqlTypeOf(decimal_38_0) tOfdecimal_38_0,
  decimal_38_1,
  sqlTypeOf(decimal_38_1) tOfdecimal_38_1,
  decimal_38_4,
  sqlTypeOf(decimal_38_4) tOfdecimal_38_4,
  decimal_without_null_38_4,
  sqlTypeOf(decimal_without_null_38_4) tOfdecimal_without_null_38_4,
  decimal_with_null_38_4,
  sqlTypeOf(decimal_with_null_38_4) tOfdecimal_with_null_38_4,
  decimal_38_37,
  sqlTypeOf(decimal_38_37) tOfdecimal_38_37
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL38`;
