select sum(length(coalesce(cast(bigint_col as varchar(100)), '-1'))) from hive.null_schemachange;
