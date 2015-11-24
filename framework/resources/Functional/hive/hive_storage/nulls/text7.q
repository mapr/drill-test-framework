select coalesce(case when varchar_col='' then null when substr(varchar_col, 1,1) is null then 'HAHA' else varchar_col end, 'abc') from hive.null_schemachange;
