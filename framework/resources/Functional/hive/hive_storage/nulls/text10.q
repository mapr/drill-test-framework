select count(*) from hive.null_schemachange where case when varchar_col='' then null else varchar_col end is null;
