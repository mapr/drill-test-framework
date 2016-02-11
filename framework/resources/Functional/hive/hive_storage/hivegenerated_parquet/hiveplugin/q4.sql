select count(*) from hive1_fewtypes_null_parquet where cast(interval_col as interval day) is null;
