select coalesce(case when varchar_col='' then null else varchar_col end, 'abc') from hive.null_schemachange
