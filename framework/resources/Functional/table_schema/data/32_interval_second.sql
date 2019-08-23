CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL SECOND,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_second_32`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL SECOND)
FROM dfs.drillTestDir.`table_schema/interval_second_32`;
RESET `store.table.use_schema_file`;
