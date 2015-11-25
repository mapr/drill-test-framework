select sum(distinct(coalesce(bigint_col, -1))) from hive.null_schemachange;
