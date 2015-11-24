select count(*) from hive.fewtypes_null_compressed_gz where cast(interval_col as interval day) is null;
