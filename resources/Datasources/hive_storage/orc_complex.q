DROP TABLE IF EXISTS orc_create_people_staging;
DROP TABLE IF EXISTS orc_create_people;

CREATE TABLE orc_create_people_staging (
  id int,
  first_name string,
  last_name string,
  address string,
  state string);

LOAD DATA LOCAL INPATH 'resources/Datasources/hive_storage/orc_create_people.txt' 
OVERWRITE INTO TABLE orc_create_people_staging;

CREATE TABLE orc_create_people (
  id int,
  first_name string,
  last_name string,
  address string)
PARTITIONED BY (state string)
STORED AS orc;

set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE orc_create_people PARTITION (state)
  SELECT * FROM orc_create_people_staging;


