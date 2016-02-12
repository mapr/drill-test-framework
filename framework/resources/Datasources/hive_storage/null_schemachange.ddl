drop table if exists null_schemachange;
create external table null_schemachange (
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
LOCATION '/drill/testdata/hive_storage/null_schemachange'
TBLPROPERTIES ("serialization.null.format"="null");


drop table if exists onlynulls; 
create external table onlynulls ( 
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
LOCATION '/drill/testdata/hive_storage/onlynulls' 
TBLPROPERTIES ("serialization.null.format"="null");
