CREATE OR REPLACE SCHEMA (
  decimal_5_5 DECIMAL(5,5),
  varchar_decimal_5_5 VARCHAR,
  decimal_5_3 DECIMAL(5,3),
  varchar_decimal_5_3 VARCHAR,
  decimal_5_0 DECIMAL(5,0),
  varchar_decimal_5_0 VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/decimal`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  decimal_5_5,
  sqlTypeOf(decimal_5_5),
  CAST(varchar_decimal_5_5 as DECIMAL(5,5)),
  decimal_5_3,
  sqlTypeOf(decimal_5_3),
  CAST(varchar_decimal_5_3 as DECIMAL(5,3)),
  decimal_5_0,
  sqlTypeOf(decimal_5_0),
  CAST(varchar_decimal_5_0 as DECIMAL(5,0))
FROM dfs.drillTestDir.`table_schema/decimal`;
RESET `store.table.use_schema_file`;
