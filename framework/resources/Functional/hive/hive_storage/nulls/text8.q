select coalesce(case when varchar_col='' then null when length(substr(varchar_col, 1,1))=1 then 'HAHA' else varchar_col end, 'abc') from hive.null_schemachange;
