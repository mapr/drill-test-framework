DROP TABLE IF EXISTS orc_create_people_staging;
DROP TABLE IF EXISTS orc_create_people;
DROP TABLE IF EXISTS orc_create_people_dp;

CREATE TABLE orc_create_people_staging (
  id int,
  first_name string,
  last_name string,
  address string,
  state string);

LOAD DATA LOCAL INPATH 'framework/resources/Datasources/hive_storage/orc_create_people.txt' 
OVERWRITE INTO TABLE orc_create_people_staging;

CREATE TABLE orc_create_people (
  id int,
  first_name string,
  last_name string,
  address string)
PARTITIONED BY (state string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
  STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
  OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat';


set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE orc_create_people PARTITION (state)
  SELECT * FROM orc_create_people_staging;

CREATE EXTERNAL TABLE orc_create_people_dp (
  id int,
  first_name string,
  last_name string,
  address string)
PARTITIONED BY (state string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
  STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
  OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION "/drill/testdata/hive_storage/orc_create_people_dp";

set hive.exec.dynamic.partition.mode=true;
INSERT OVERWRITE TABLE orc_create_people_dp PARTITION (state)
  SELECT id,first_name,last_name,address,state FROM orc_create_people_staging;
set hive.exec.dynamic.partition.mode=strict;
