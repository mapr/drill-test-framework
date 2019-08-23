CREATE OR REPLACE SCHEMA (
  time_col TIME,
  varchar_time_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/time`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  time_col,
  sqlTypeOf(time_col),
  CAST(varchar_time_col as TIME)
FROM dfs.drillTestDir.`table_schema/time`;
RESET `store.table.use_schema_file`;
