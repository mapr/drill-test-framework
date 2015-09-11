create database if not exists crosssources;
drop table if exists crosssources.fewtypes_null_hive;
create external table crosssources.fewtypes_null_hive (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/cross-sources/fewtypes_null_hive'
TBLPROPERTIES ("serialization.null.format"="null");

drop table if exists crosssources.fewtypes_null_hbase_source;
create external table crosssources.fewtypes_null_hbase_source (
  row_key int,
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/cross-sources/fewtypes_null_hbase_source'
TBLPROPERTIES ("serialization.null.format"="null");

--DROP TABLE IF EXISTS crosssources.fewtypes_null_hbase;
--CREATE TABLE crosssources.fewtypes_null_hbase (
--  key int,
--  int_col int,
--  bigint_col bigint,
--  date_col date,
--  time_col string,
--  timestamp_col timestamp,
--  interval_col string,
--  varchar_col string,
--  float_col float,
--  double_col double,
--  bool_col boolean
--)
--STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
-- WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,types:int_col,types:bigint_col,types:date_col,types:time_col,types:timestamp_col,types:interval_col,types:varchar_col,types:float_col,types:double_col,types:bool_col")
--TBLPROPERTIES ("hbase.table.name" = "fewtypes_null");

--insert into table crosssources.fewtypes_null_hbase select row_key, int_col, bigint_col, date_col, time_col, timestamp_col, interval_col, varchar_col, float_col, double_col, bool_col from crosssources.fewtypes_null_hbase_source where row_key != 21;
