select count(*) from hive.fewtypes_null_compressed_seq_snappy where cast(interval_col as interval day) is null;
