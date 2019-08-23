CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL MONTH,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_month_30`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL MONTH)
FROM dfs.drillTestDir.`table_schema/interval_month_30`;
RESET `store.table.use_schema_file`;
