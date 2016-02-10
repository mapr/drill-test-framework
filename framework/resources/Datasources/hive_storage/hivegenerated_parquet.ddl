drop table if exists hive1_fewtypes_null_parquet; 
create external table hive1_fewtypes_null_parquet (
      int_col int,
      bigint_col bigint,
      date_col string,
      time_col string,
      timestamp_col timestamp,
      interval_col string,
      varchar_col string,
      float_col float,
      double_col double,
      bool_col boolean
    )
stored as parquet
location '/drill/testdata/hive_storage/hive1_fewtypes_null';
