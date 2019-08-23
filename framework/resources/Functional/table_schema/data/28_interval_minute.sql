CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL MINUTE,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_minute_28`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL MINUTE)
FROM dfs.drillTestDir.`table_schema/interval_minute_28`;
RESET `store.table.use_schema_file`;
