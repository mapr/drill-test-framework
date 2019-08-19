CREATE OR REPLACE SCHEMA (
  varchar_col2 VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/varchar_14`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  *
FROM dfs.drillTestDir.`table_schema/varchar_14`;
RESET `store.table.use_schema_file`;
