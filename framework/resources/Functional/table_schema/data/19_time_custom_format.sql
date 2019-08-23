CREATE OR REPLACE SCHEMA (
  time_format_col TIME format 'h:m_s-SSS a',
  varchar_time_format_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/time_custom_format`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  time_format_col,
  sqlTypeOf(time_format_col),
  TO_TIME(varchar_time_format_col, 'h:m_s-SSS a')
FROM dfs.drillTestDir.`table_schema/time_custom_format`;
RESET `store.table.use_schema_file`;
