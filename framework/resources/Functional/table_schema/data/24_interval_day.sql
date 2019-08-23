CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL DAY,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_day_24`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL DAY)
FROM dfs.drillTestDir.`table_schema/interval_day_24`;
RESET `store.table.use_schema_file`;
