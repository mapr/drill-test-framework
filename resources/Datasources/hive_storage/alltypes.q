DROP TABLE IF EXISTS ALLTYPES;
DROP TABLE IF EXISTS ALLDRILLTYPES;
create table alltypes
         (c1 int, c2 boolean, c3 double, c4 string,
         c5 array<int>, c6 map<int,string>, c7 map<string,string>,
         c8 struct<r:string,s:int,t:double>,
         c9 tinyint, c10 smallint, c11 float, c12 bigint,
         c13 array<array<string>>,
         c14 map<int, map<int,int>>,
         c15 struct<r:int,s:struct<a:int,b:string>>,
         c16 array<struct<m:map<string,string>,n:int>>,
         c17 timestamp,
         c18 decimal,
         c19 binary,
         c20 date);
         
load data local inpath 'resources/Datasources/hive_storage/datatypes.txt' into table alltypes;
         
create table alldrilltypes 
         (c1 int, c2 boolean, c3 double, c4 string,
         c9 tinyint, c10 smallint, c11 float, c12 bigint,
         c19 binary);

FROM alltypes
INSERT OVERWRITE TABLE alldrilltypes SELECT c1,c2,c3,c4,c9,c10,c11,c12,c19;         

        
DROP TABLE IF EXISTS as_sequencefile1;
CREATE TABLE as_sequencefile1(string1 STRING,
                     int1 INT,
                     tinyint1 TINYINT,
                     smallint1 SMALLINT,
                     bigint1 BIGINT,
                     boolean1 BOOLEAN,
                     float1 FLOAT,
                     double1 DOUBLE,
                     enum1 STRING,
                     nullableint INT,
                     bytes1 BINARY,
                     fixed1 BINARY)
STORED AS
INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileOutputFormat';
         
INSERT OVERWRITE TABLE as_sequencefile1 SELECT string1, int1, tinyint1, smallint1, bigint1, boolean1, float1, double1, enum1, nullableInt, encode(string1, 'UTF-8'), encode(string1, 'UTF-8') FROM test_serializer;

drop table if exists fewtypes_null_hive;
create external table fewtypes_null_hive (
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

drop table if exists fewtypes_null_hive_rc;
create external table fewtypes_null_hive_rc (
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
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'
STORED AS
  INPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileOutputFormat';

insert overwrite table fewtypes_null_hive_rc select * from fewtypes_null_hive;

drop table if exists fewtypes_null_hive_sq;
create external table fewtypes_null_hive_sq (
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
STORED AS
INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileOutputFormat';

insert overwrite table fewtypes_null_hive_sq select * from fewtypes_null_hive;

drop table if exists fewtypes_null_hive_orc;
create external table fewtypes_null_hive_orc (
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
STORED AS ORC;

insert overwrite table fewtypes_null_hive_orc select * from fewtypes_null_hive;
