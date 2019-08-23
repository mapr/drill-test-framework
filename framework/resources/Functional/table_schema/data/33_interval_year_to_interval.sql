CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_year`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL YEAR)
FROM dfs.drillTestDir.`table_schema/interval_year`;
RESET `store.table.use_schema_file`;
