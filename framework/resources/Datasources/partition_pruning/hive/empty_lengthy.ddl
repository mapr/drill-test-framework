DROP TABLE IF EXISTS empty_lengthy;
CREATE EXTERNAL TABLE empty_lengthy (
    int_col INT,
    varchar_col STRING
   )
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/empty_lengthy_partitions";

DROP TABLE IF EXISTS empty_lengthy1;
CREATE EXTERNAL TABLE empty_lengthy1 (
    int_col INT,
    varchar_col STRING
   )
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/empty_lengthy_partitions"
TBLPROPERTIES ("serialization.null.format"="?");


DROP TABLE IF EXISTS empty_lengthy_p1;
CREATE TABLE empty_lengthy_p1 (
    int_col INT
   )
PARTITIONED BY (varchar_col STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/empty_lengthy_partitions_p1";

SET hive.exec.dynamic.partition.mode=true;

insert overwrite table empty_lengthy_p1 partition (varchar_col) 
select int_col, case when varchar_col='dfg' then null else varchar_col END from empty_lengthy;

DROP TABLE IF EXISTS empty_lengthy_p2;
CREATE TABLE empty_lengthy_p2 (
    int_col INT
   )
PARTITIONED BY (varchar_col STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/empty_lengthy_partitions_p2"
TBLPROPERTIES ("serialization.null.format"="?");

SET hive.exec.dynamic.partition.mode=true;

insert overwrite table empty_lengthy_p2 partition (varchar_col)
select int_col, varchar_col from empty_lengthy;
