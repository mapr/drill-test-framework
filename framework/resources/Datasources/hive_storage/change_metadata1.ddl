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
