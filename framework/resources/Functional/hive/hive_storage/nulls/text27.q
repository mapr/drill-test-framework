select * from hive.null_schemachange where date_col is null or date_col > '2015-01-01' order by date_col nulls first limit 8;
