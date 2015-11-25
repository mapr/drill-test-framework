select distinct varchar_col from hive.null_schemachange where substr(lower(varchar_col), 1, 1)='n';
