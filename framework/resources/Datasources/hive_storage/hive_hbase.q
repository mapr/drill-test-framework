DROP TABLE IF EXISTS pokes;
CREATE TABLE pokes (foo INT, bar STRING);
DROP TABLE IF EXISTS hbase_table_1;

load data local inpath 'framework/resources/Datasources/hive_storage/kv1.txt' OVERWRITE INTO TABLE pokes;

CREATE TABLE hbase_table_1(key int, value string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:val")
TBLPROPERTIES ("hbase.table.name" = "hive_hbase");

INSERT OVERWRITE TABLE hbase_table_1 SELECT * FROM pokes WHERE foo=98;

DROP TABLE IF EXISTS VOTER_HIVE;
CREATE EXTERNAL TABLE VOTER_HIVE
(
   VOTER_ID SMALLINT,
   NAME VARCHAR(40),
   AGE TINYINT,
   REGISTRATION STRING,
   CONTRIBUTIONS float,
   VOTERZONE INT,
   CREATE_TIME TIMESTAMP
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE LOCATION "/drill/testdata/hive_storage/voter_txt"
TBLPROPERTIES('serialization.null.format'='');

DROP TABLE IF EXISTS STUDENT_HIVE;
CREATE EXTERNAL TABLE STUDENT_HIVE
( 
   STUDENT_ID INT,
   NAME VARCHAR(50),
   AGE TINYINT,
   GPA double,
   STUDENTNUM BIGINT,
   CREATE_TIME TIMESTAMP
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE LOCATION "/drill/testdata/hive_storage/student_txt"
TBLPROPERTIES('serialization.null.format'='');

drop table if exists hbase_student;
create table hbase_student(key int, name varchar(30), age tinyint, gpa decimal(6,2), studentnum bigint, create_time timestamp) STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' WITH SERDEPROPERTIES ("hbase.columns.mapping" = ':key,onecf:name,twocf:age,threecf:gpa,fourcf:studentnum,fivecf:create_time') TBLPROPERTIES("hbase.table.name" = "hbase_student");
insert overwrite table hbase_student select * from student_hive;

drop table if exists hbase_voter;
create table hbase_voter(key int,name varchar(30),age int,registration string,contributions decimal(6,2),voternum smallint,create_date timestamp)STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' WITH SERDEPROPERTIES ("hbase.columns.mapping" = ':key,onecf:name,twocf:age,twocf:registration,threecf:contributions,threecf:voterzone,fourcf:create_date') TBLPROPERTIES("hbase.table.name" = "hbase_voter");
insert overwrite table hbase_voter select * from voter_hive;

drop table if exists ext_hbvoter;
create external table ext_hbvoter(key int,name varchar(30),age int,registration string,contributions decimal(6,2),voternum smallint,create_date timestamp)STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' WITH SERDEPROPERTIES ("hbase.columns.mapping" = ':key,onecf:name,twocf:age,twocf:registration,threecf:contributions,threecf:voterzone,fourcf:create_date') TBLPROPERTIES("hbase.table.name" = "hbvoter");
