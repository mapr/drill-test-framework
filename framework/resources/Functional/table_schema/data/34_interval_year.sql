CREATE OR REPLACE SCHEMA (
  interval_col INTERVAL YEAR,
  varchar_interval_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/interval_year_34`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  interval_col,
  sqlTypeOf(interval_col),
  CAST(varchar_interval_col as INTERVAL YEAR)
FROM dfs.drillTestDir.`table_schema/interval_year_34`;
RESET `store.table.use_schema_file`;
