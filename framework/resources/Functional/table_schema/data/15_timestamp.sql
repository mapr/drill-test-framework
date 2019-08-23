CREATE OR REPLACE SCHEMA (
  timestamp_col TIMESTAMP,
  varchar_timestamp_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/timestamp`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  timestamp_col,
  sqlTypeOf(timestamp_col),
  CAST(varchar_timestamp_col as TIMESTAMP)
FROM dfs.drillTestDir.`table_schema/timestamp`;
RESET `store.table.use_schema_file`;
