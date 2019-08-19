CREATE OR REPLACE SCHEMA (
  varchar_col VARCHAR,
  varchar_col2 VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/varchar`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  varchar_col,
  varchar_col2
FROM dfs.drillTestDir.`table_schema/varchar`;
RESET `store.table.use_schema_file`;
