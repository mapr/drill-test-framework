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
LOCATION '/drill/testdata/hive_storage/sample';

create external table if not exists hive_storage.hive_maps (
    id string, m map<string, string>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE 
LOCATION '/drill/testdata/hive_storage/hive_maps.txt';

DROP TABLE IF EXISTS lineitem_text_hive_temp;
CREATE EXTERNAL TABLE lineitem_text_hive_temp (
    l_orderkey INT,
    l_partkey INT,
    l_suppkey INT,
    l_linenumber INT,
    l_quantity DOUBLE,
    l_extendedprice DOUBLE,
    l_discount DOUBLE,
    l_tax DOUBLE,
    l_returnflag STRING,
    l_linestatus STRING,
    l_shipdate DATE,
    l_commitdate DATE,
    l_receiptdate DATE,
    l_shipinstruct STRING,
    l_shipmode STRING,
    l_comment STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitem";

CREATE TABLE if not exists h1_testpart2(id INT) PARTITIONED BY(id2 int);
set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE h1_testpart2 PARTITION(id2) SELECT 1 as id1 , 20150101 as id2 from lineitem_text_hive_temp limit 1;
INSERT OVERWRITE TABLE h1_testpart2 PARTITION(id2) SELECT 1 as id1 , null as id2 from lineitem_text_hive_temp limit 1;

create table if not exists hier_null_partitions(col3 INT) PARTITIONED BY(col1 int, col2 int);
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, 2 as col2, 3 as col1 from lineitem_text_hive_temp limit 1;
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, 2 as col2, null as col1 from lineitem_text_hive_temp limit 1;
insert overwrite table hier_null_partitions partition(col1, col2) select 1 as col3, null as col2, null as col1 from lineitem_text_hive_temp limit 1;

drop table if exists voter_text;
create table voter_text (
   VOTER_ID SMALLINT,
   NAME VARCHAR(40),
   AGE TINYINT,
   REGISTRATION CHAR(11),
   CONTRIBUTIONS float,
   VOTERZONE INT,
   CREATE_TIMESTAMP TIMESTAMP,
   create_date date
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE TBLPROPERTIES('serialization.null.format'='');

load data local inpath 'framework/resources/Datasources/hive_storage/voterhive.tsv' into table voter_text;

drop table if exists voter_parquet;
create table voter_parquet (
   VOTER_ID SMALLINT,
   NAME VARCHAR(40),
   AGE TINYINT,
   REGISTRATION CHAR(11),
   CONTRIBUTIONS float,
   VOTERZONE INT,
   CREATE_TIMESTAMP TIMESTAMP,
   create_date date
)
STORED AS PARQUET;

FROM voter_text insert overwrite table voter_parquet select voter_id,name,age,registration,contributions,voterzone,create_timestamp,create_date;

drop table if exists voter_avro;
create table voter_avro (
    voter_id smallint,
    name varchar(40),
    age TINYINT,
    contributions float,
    voterzone int,
    create_timestamp timestamp,
    create_date date)
PARTITIONED BY (registration char(11))
STORED AS AVRO;

FROM voter_text insert overwrite table voter_avro PARTITION (registration) select voter_id,name,age,contributions,voterzone,create_timestamp,create_date,registration;

drop table if exists voter_orc;
create table voter_orc (
    voter_id smallint,
    name varchar(40),
    age TINYINT,
    contributions float,
    voterzone int,
    create_timestamp timestamp,
    create_date date)
PARTITIONED BY (registration char(11))
STORED AS ORC tblproperties ("orc.compress"="SNAPPY");

FROM voter_text insert overwrite table voter_orc PARTITION (registration) select voter_id,name,age,contributions,voterzone,create_timestamp,create_date,registration;
