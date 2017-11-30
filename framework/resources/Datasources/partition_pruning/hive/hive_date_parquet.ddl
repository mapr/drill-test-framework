-- creating dynamic partitions over DATE is not supported in hive1.0

SET hive.exec.dynamic.partition.mode=nonstrict;

DROP TABLE IF EXISTS lineitem_text_partitioned_hive_date;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_text_partitioned_hive_date (
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
PARTITIONED BY (dt DATE)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitem_datepart";

ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-20') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-20';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-21') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-21';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-22') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-22';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-23') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-23';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-24') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-24';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-25') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-25';
ALTER TABLE lineitem_text_partitioned_hive_date ADD PARTITION (dt='2014-10-26') location '/drill/testdata/partition_pruning/hive/text/lineitem_datepart/2014-10-26';


DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive_date;
CREATE TABLE IF NOT EXISTS lineitem_parquet_partitioned_hive_date (
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
    l_shipdate STRING,
    l_commitdate STRING,
    l_receiptdate STRING,
    l_shipinstruct STRING,
    l_shipmode STRING,
    l_comment STRING
)
PARTITIONED BY (dt DATE) STORED AS PARQUET;

FROM lineitem_text_partitioned_hive_date
insert overwrite table lineitem_parquet_partitioned_hive_date partition(dt) select *;

-- Hive dynamic partitions

SET hive.exec.dynamic.partition.mode=true;

CREATE DATABASE IF NOT EXISTS dynamic_partitions;
USE dynamic_partitions;

DROP TABLE IF EXISTS lineitem_text_partitioned_hive_date;
CREATE TABLE lineitem_text_partitioned_hive_date (
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
    l_shipdate STRING,
    l_commitdate STRING,
    l_receiptdate STRING,
    l_shipinstruct STRING,
    l_shipmode STRING,
    l_comment STRING
)
PARTITIONED BY (dt DATE)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/dynamic_partition_lineitem_datepart";

INSERT OVERWRITE TABLE dynamic_partitions.lineitem_text_partitioned_hive_date PARTITION (dt)
SELECT
    l_orderkey,
    l_partkey ,
    l_suppkey,
    l_linenumber,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax ,
    l_returnflag ,
    l_linestatus,
    l_shipdate ,
    l_commitdate ,
    l_receiptdate ,
    l_shipinstruct,
    l_shipmode,
    l_comment,
    dt
FROM DEFAULT.lineitem_text_partitioned_hive_date;