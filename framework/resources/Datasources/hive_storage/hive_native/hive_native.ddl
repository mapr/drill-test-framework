create database if not exists hive_native;

drop table if exists hive_native.fewtypes_null_hive;
create external table hive_native.fewtypes_null_hive (
  int_col int,
  bigint_col bigint,
  date_col string,
  time_col string,
  timestamp_col string,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
stored as parquet
location '/drill/testdata/hive_storage/hive_native/drillgen_fewtypes_null';

drop table if exists hive_native.drill_supported_hivetypes;
create external table hive_native.drill_supported_hivetypes ( 
  c1 int, 
  c2 boolean, 
  c3 double, c4 string,
  c9 tinyint, 
  c10 smallint, 
  c11 float, 
  c12 bigint,
  c17 timestamp,
  c19 string,
  c20 string
)
stored as parquet
location '/drill/testdata/hive_storage/hive_native/drill_supported_hivetypes';

drop table if exists hive_native.hivegen_fewtypes_null_hive;
create external table hive_native.hivegen_fewtypes_null_hive (
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
location '/drill/testdata/hive_storage/hive_native/hivegen_fewtypes_null';
