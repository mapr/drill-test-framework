CREATE OR REPLACE SCHEMA (
  date_format_col DATE format 'CC+MMM  DD',
  varchar_date_format_col VARCHAR
) FOR TABLE dfs.drillTestDir.`table_schema/date_custom_format`;
SET `store.table.use_schema_file` = true;
--@test
SELECT
  date_format_col,
  sqlTypeOf(date_format_col),
  TO_DATE(varchar_date_format_col, 'CC+MMM  DD')
FROM dfs.drillTestDir.`table_schema/date_custom_format`;
RESET `store.table.use_schema_file`;
