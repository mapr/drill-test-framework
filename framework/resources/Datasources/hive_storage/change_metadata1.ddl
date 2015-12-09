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


drop table if exists modify_columntypes2;
create external table if not exists modify_columntypes2 (
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

create external table if not exists orc_modify_columntypes_src (
    l_orderkey int,
    l_partkey int,
    l_suppkey int,
    l_linenumber int,
    l_quantity double,
    l_extendedprice double,
    l_discount double,
    l_tax double,
    l_returnflag string,
    l_linestatus string,
    l_shipdate date,
    l_commitdate date,
    l_receiptdate date,
    l_shipinstruct string,
    l_shipmode string,
    l_comment string
)
STORED AS orc
LOCATION '/drill/testdata/hive_storage/orc_lineitem';

drop table if exists seq_modify_columntypes1;
create table if not exists seq_modify_columntypes1 (
    l_orderkey int,
    l_partkey int,
    l_suppkey int,
    l_linenumber int,
    l_quantity double,
    l_extendedprice double,
    l_discount double,
    l_tax double,
    l_returnflag string,
    l_linestatus string,
    l_shipdate date,
    l_commitdate date,
    l_receiptdate date,
    l_shipinstruct string,
    l_shipmode string,
    l_comment string
)
STORED AS sequencefile
LOCATION '/drill/testdata/hive_storage/seq_modify_columntypes1';

insert into table seq_modify_columntypes1 select * from orc_modify_columntypes_src;
