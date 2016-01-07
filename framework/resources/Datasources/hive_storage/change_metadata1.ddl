drop table if exists add_columns1;
create external table if not exists add_columns1 (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/hive_storage/fewtypes_null.tbl'
TBLPROPERTIES ("serialization.null.format"="null");

drop table if exists remove_columns1;
create external table if not exists remove_columns1 (
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
LOCATION '/drill/testdata/hive_storage/fewtypes_null.tbl'
TBLPROPERTIES ("serialization.null.format"="null");

drop table if exists add_columns2;
create external table if not exists add_columns2 (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/hive_storage/add_remove_columns'
TBLPROPERTIES ("serialization.null.format"="null");

drop table if exists remove_columns2;
create external table if not exists remove_columns2 (
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
LOCATION '/drill/testdata/hive_storage/add_remove_columns'
TBLPROPERTIES ("serialization.null.format"="null");



drop table if exists modify_columntypes1;
create external table if not exists modify_columntypes1 (
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
LOCATION '/drill/testdata/hive_storage/fewtypes_null.tbl'
TBLPROPERTIES ("serialization.null.format"="null");

CREATE EXTERNAL TABLE IF NOT EXISTS mktevents(
  event_id INT,
  user_id INT,
  add_id INT,
  add_date INT,
  add_hour INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/mktevents.tbl';

DROP TABLE IF EXISTS dpp_compressed_mktevents;
CREATE TABLE IF NOT EXISTS dpp_compressed_mktevents
(event_id INT,user_id INT)
PARTITIONED BY (add_id INT, add_date INT, add_hour INT) STORED AS PARQUET TBLPROPERTIES ("parquet.compress"="SNAPPY", "parquet.stripe.size"="67108864","parquet.row.index.stride"="50000");

set hive.optimize.sort.dynamic.partition=true;
set hive.exec.max.dynamic.partitions=50000;
set hive.exec.max.dynamic.partitions.pernode=25000;
SET hive.exec.dynamic.partition.mode=dynamic;
insert overwrite table dpp_compressed_mktevents partition (add_id, add_date, add_hour)
select event_id, user_id, add_id, add_date, add_hour from mktevents;
