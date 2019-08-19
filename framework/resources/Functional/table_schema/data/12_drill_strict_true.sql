CREATE OR REPLACE SCHEMA (
  varchar_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/varchar_12`
PROPERTIES ('drill.strict' = 'true');
SET `store.table.use_schema_file` = true;
--@test
SELECT
  *
FROM dfs.drillTestDir.`table_schema/varchar_12`;
RESET `store.table.use_schema_file`;
