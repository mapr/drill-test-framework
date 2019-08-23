CREATE OR REPLACE SCHEMA (
  varchar_col2 VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/varchar_13`
PROPERTIES ('drill.strict' = 'false');
SET `store.table.use_schema_file` = true;
--@test
SELECT
  *
FROM dfs.drillTestDir.`table_schema/varchar_13`;
RESET `store.table.use_schema_file`;
