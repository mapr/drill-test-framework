CREATE OR REPLACE SCHEMA (
  double_col DOUBLE,
  varchar_double_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/double_2_files`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  double_col,
  sqlTypeOf(double_col),
  CAST(varchar_double_col as DOUBLE)
FROM dfs.drillTestDir.`table_schema/double_2_files`;
RESET `store.table.use_schema_file`;
