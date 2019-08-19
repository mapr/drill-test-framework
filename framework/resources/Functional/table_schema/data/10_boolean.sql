CREATE OR REPLACE SCHEMA (
  boolean_col BOOLEAN,
  varchar_boolean_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/boolean`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  boolean_col,
  sqlTypeOf(boolean_col),
  CAST(varchar_boolean_col as BOOLEAN)
FROM dfs.drillTestDir.`table_schema/boolean`;
RESET `store.table.use_schema_file`;
