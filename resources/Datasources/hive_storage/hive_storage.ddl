create database if not exists hive_storage;
create external table if not exists hive_storage.fewtypes_null_parquet (
  int_col int,
  bigint_col bigint,
  date_col int,
  time_col int,
  timestamp_col bigint,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
STORED AS PARQUET
LOCATION '/drill/testdata/hive_storage/fewtypes_null_parquet';

create external table if not exists hive_storage.fewtypes_parquet (
  int_col int,
  bigint_col bigint,
  date_col int,
  time_col int,
  timestamp_col bigint,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
STORED AS PARQUET
LOCATION '/drill/testdata/hive_storage/fewtypes_parquet';

create view if not exists hive_storage.fewtypes_null_parquet_nonullsview
as select int_col, bigint_col, date_col, time_col, timestamp_col, interval_col, varchar_col, float_col, double_col, bool_col
from hive_storage.fewtypes_null_parquet 
where int_col is not null and 
    bigint_col is not null and
    date_col is not null and 
    time_col is not null and 
    timestamp_col is not null and
    interval_col is not null and
    varchar_col is not null and 
    float_col is not null and
    double_col is not null and
    bool_col is not null;

CREATE EXTERNAL TABLE IF NOT EXISTS hive_storage.json_table ( json string )
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/sample.json';

create external table if not exists hive_storage.hive_maps (
    id string, m map<string, string>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE 
LOCATION '/drill/testdata/hive_storage/hive_maps.txt';

CREATE TABLE if not exists h1_testpart2(id INT) PARTITIONED BY(id2 int);
set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE h1_testpart2 PARTITION(id2) SELECT 1 as id1 , 20150101 as id2 from lineitem_text_hive limit 1;
INSERT OVERWRITE TABLE h1_testpart2 PARTITION(id2) SELECT 1 as id1 , null as id2 from lineitem_text_hive limit 1;

create table if not exists hier_null_partitions(col3 INT) PARTITIONED BY(col1 int, col2 int);
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, 2 as col2, 3 as col1 from lineitem_text_hive limit 1;
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, 2 as col2, null as col1 from lineitem_text_hive limit 1;
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, null as col2, null as col1 from lineitem_text_hive limit 1;
