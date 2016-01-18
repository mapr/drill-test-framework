select * from hive1_fewtypes_null_parquet order by coalesce(bool_col, false), float_col nulls first limit 10;
