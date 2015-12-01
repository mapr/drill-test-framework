select length(varchar_col) from hive.null_schemachange where varchar_col in (select varchar_col from hive.onlynulls);
