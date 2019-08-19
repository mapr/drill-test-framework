CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_month`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL MONTH)
FROM dfs.drillTestDir.`table_schema/interval_month`;
RESET `store.table.use_schema_file`;
