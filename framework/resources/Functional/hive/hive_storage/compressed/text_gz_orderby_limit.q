select * from hive.fewtypes_null_compressed_gz order by coalesce(bool_col, false), float_col nulls first limit 10;
