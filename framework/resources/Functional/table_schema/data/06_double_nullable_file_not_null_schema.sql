CREATE OR REPLACE SCHEMA (
  nullable_double_col DOUBLE NOT NULL
) FOR TABLE dfs.drillTestDir.`table_schema/nullable_double_6`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  nullable_double_col,
  sqlTypeOf(nullable_double_col),
  modeOf(nullable_double_col)
FROM dfs.drillTestDir.`table_schema/nullable_double_6`;
RESET `store.table.use_schema_file`;
