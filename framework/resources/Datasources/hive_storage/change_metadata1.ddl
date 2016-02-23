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
LOCATION '/drill/testdata/hive_storage/fewtypes_null_tbl'
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
LOCATION '/drill/testdata/hive_storage/fewtypes_null_tbl'
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
LOCATION '/drill/testdata/hive_storage/fewtypes_null_tbl'
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
LOCATION '/drill/testdata/hive_storage/fewtypes_null_tbl'
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
CREATE EXTERNAL TABLE IF NOT EXISTS mktevents(
  event_id INT,
  user_id INT,
  add_id INT,
  add_date INT,
  add_hour INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/mktevents_tbl';

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

DROP TABLE IF EXISTS changemetadata_orders_partitioned;
CREATE EXTERNAL TABLE changemetadata_orders_partitioned (
    o_orderkey INT,
    o_custkey INT,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate STRING,
    o_orderpriority STRING
)
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/hive_storage/orders_partitioned";

--- ADD PARTITIONS ----
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1990) location '/drill/testdata/hive_storage/orders_partitioned/1990';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1991) location '/drill/testdata/hive_storage/orders_partitioned/1991';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1992) location '/drill/testdata/hive_storage/orders_partitioned/1992';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1993) location '/drill/testdata/hive_storage/orders_partitioned/1993';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1994) location '/drill/testdata/hive_storage/orders_partitioned/1994';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1995) location '/drill/testdata/hive_storage/orders_partitioned/1995';
ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1996) location '/drill/testdata/hive_storage/orders_partitioned/1996';


DROP TABLE IF EXISTS changemetadata_orders_partitioned1;
CREATE EXTERNAL TABLE changemetadata_orders_partitioned1 (
    o_orderkey INT,
    o_custkey INT,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate STRING,
    o_orderpriority STRING,
    o_clerk STRING,
    o_shippriority INT,
    o_comment STRING
)
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/hive_storage/orders_partitioned";

--- ADD PARTITIONS ----
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1990) location '/drill/testdata/hive_storage/orders_partitioned/1990';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1991) location '/drill/testdata/hive_storage/orders_partitioned/1991';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1992) location '/drill/testdata/hive_storage/orders_partitioned/1992';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1993) location '/drill/testdata/hive_storage/orders_partitioned/1993';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1994) location '/drill/testdata/hive_storage/orders_partitioned/1994';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1995) location '/drill/testdata/hive_storage/orders_partitioned/1995';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1996) location '/drill/testdata/hive_storage/orders_partitioned/1996';
ALTER TABLE changemetadata_orders_partitioned1 ADD PARTITION (year=1997) location '/drill/testdata/hive_storage/orders_partitioned/1997';

DROP TABLE IF EXISTS changemetadata_orders_partitioned2;
CREATE EXTERNAL TABLE changemetadata_orders_partitioned2 (
    o_orderkey INT,
    o_custkey INT,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate STRING,
    o_orderpriority STRING,
    o_clerk STRING,
    o_shippriority INT,
    o_comment STRING
)
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/hive_storage/orders_partitioned";

--- ADD PARTITIONS ----
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1990) location '/drill/testdata/hive_storage/orders_partitioned/1990';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1991) location '/drill/testdata/hive_storage/orders_partitioned/1991';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1992) location '/drill/testdata/hive_storage/orders_partitioned/1992';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1993) location '/drill/testdata/hive_storage/orders_partitioned/1993';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1994) location '/drill/testdata/hive_storage/orders_partitioned/1994';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1995) location '/drill/testdata/hive_storage/orders_partitioned/1995';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1996) location '/drill/testdata/hive_storage/orders_partitioned/1996';
ALTER TABLE changemetadata_orders_partitioned2 ADD PARTITION (year=1997) location '/drill/testdata/hive_storage/orders_partitioned/1997';
