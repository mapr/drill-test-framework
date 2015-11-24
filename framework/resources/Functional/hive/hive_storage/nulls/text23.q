select s.* from hive.null_schemachange s, hive.onlynulls n where coalesce(s.bigint_col, -1) = coalesce(n.bigint_col, -1);
