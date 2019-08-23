CREATE OR REPLACE SCHEMA (
  integer_col INTEGER,
  varchar_integer_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/integer`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  integer_col,
  sqlTypeOf(integer_col),
  CAST(varchar_integer_col as INT)
FROM dfs.drillTestDir.`table_schema/integer`;
RESET `store.table.use_schema_file`;
