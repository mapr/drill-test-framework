select sum(length(coalesce(case when varchar_col='' then null when length(substr(varchar_col, 1,1))=1 then 'HAHA' else null end, 'abc'))) from hive.null_schemachange;
