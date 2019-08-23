CREATE OR REPLACE SCHEMA (
  float_col FLOAT,
  varchar_float_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/float`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  float_col,
  sqlTypeOf(float_col),
  CAST(varchar_float_col as FLOAT)
FROM dfs.drillTestDir.`table_schema/float`;
RESET `store.table.use_schema_file`;
