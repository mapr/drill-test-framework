SELECT
  nullable_double_col,
  sqlTypeOf(nullable_double_col),
  modeOf(nullable_double_col)
FROM TABLE (dfs.drillTestDir.`table_schema/nullable_double_8`(schema => 'inline=(nullable_double_col DOUBLE not null default `777.11`)', type => 'text', fieldDelimiter => ',', extractHeader => true));
