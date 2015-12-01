select count(*) from hive.fewtypes_null_compressed_bz2 where cast(interval_col as interval day) is null;
