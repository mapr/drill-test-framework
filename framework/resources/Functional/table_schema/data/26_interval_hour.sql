CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL HOUR,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_hour_26`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL HOUR)
FROM dfs.drillTestDir.`table_schema/interval_hour_26`;
RESET `store.table.use_schema_file`;
