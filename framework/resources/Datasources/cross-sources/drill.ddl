create database if not exists crosssources;
drop table if exists crosssources.fewtypes_hive;
create external table crosssources.fewtypes_hive (
  int_col string,
  bigint_col string,
  date_col string,
  time_col string,
  timestamp_col string,
  interval_col string,
  varchar_col string,
  float_col string,
  double_col string,
  bool_col string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/cross-sources/fewtypes.tbl/'
TBLPROPERTIES ("serialization.null.format"="null");



create table dfs.`cross-sources`.fewtypes as
select
    makerequired(cast(int_col as int)) int_col,
    makerequired(cast(bigint_col as bigint)) bigint_col,
    makerequired(cast(date_col as date)) date_col,
    makerequired(cast(time_col as time)) time_col,
    makerequired(cast(timestamp_col as timestamp)) timestamp_col,
    makerequired(cast(interval_col as varchar(24))) interval_col,
    makerequired(cast(varchar_col as varchar(50))) varchar_col,
    makerequired(cast(float_col as float)) float_col,
    makerequired(cast(double_col as double)) double_col,
    makerequired(cast(bool_col as boolean)) bool_col
from hive.crosssources.fewtypes_hive;
