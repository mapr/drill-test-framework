CREATE OR REPLACE SCHEMA (
  bigint_col BIGINT,
  varchar_bigint_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/bigint`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  bigint_col,
  sqlTypeOf(bigint_col),
  CAST(varchar_bigint_col as BIGINT)
FROM dfs.drillTestDir.`table_schema/bigint`;
RESET `store.table.use_schema_file`;
