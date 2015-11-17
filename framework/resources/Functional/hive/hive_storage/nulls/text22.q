select s.* from hive.null_schemachange s, hive.onlynulls n where s.bigint_col = n.bigint_col;
