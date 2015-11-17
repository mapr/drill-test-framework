select s.* from hive.null_schemachange s, hive.onlynulls n where s.varchar_col = n.varchar_col;
