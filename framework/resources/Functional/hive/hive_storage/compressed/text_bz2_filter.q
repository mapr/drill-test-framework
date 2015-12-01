select * from hive.fewtypes_null_compressed_bz2 where coalesce(date_col, date '2015-01-01', date_col) > date '2014-12-31';
