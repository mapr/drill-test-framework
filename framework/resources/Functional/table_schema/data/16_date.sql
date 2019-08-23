CREATE OR REPLACE SCHEMA (
  date_col DATE,
  varchar_date_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/date`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  date_col,
  sqlTypeOf(date_col),
  CAST(varchar_date_col as date)
FROM dfs.drillTestDir.`table_schema/date`;
RESET `store.table.use_schema_file`;
