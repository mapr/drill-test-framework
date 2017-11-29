DROP TABLE IF EXISTS lineitem_text_partitioned_hive_string;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_text_partitioned_hive_string (
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
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitempart";

ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1991') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1991';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1992') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1992';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1993') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1993';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1994') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1994';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1995') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1995';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1996') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1996';
ALTER TABLE lineitem_text_partitioned_hive_string ADD PARTITION (year='1997') location '/drill/testdata/partition_pruning/hive/text/lineitempart/1997';

DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive_string;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_parquet_partitioned_hive_string (
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
PARTITIONED BY (year STRING)
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/lineitempart";

ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1991') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1991';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1992') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1992';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1993') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1993';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1994') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1994';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1995') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1995';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1996') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1996';
ALTER TABLE lineitem_parquet_partitioned_hive_string ADD PARTITION (year='1997') location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1997';


-- Hive dynamic partitions

SET hive.exec.dynamic.partition.mode=true;

CREATE DATABASE IF NOT EXISTS dynamic_partitions;
USE dynamic_partitions;

DROP TABLE IF EXISTS lineitem_text_partitioned_hive_string;
CREATE TABLE IF NOT EXISTS lineitem_text_partitioned_hive_string (
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
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/dynamic_partition_lineitempart_string";

INSERT OVERWRITE TABLE DYNAMIC_PARTITIONS.LINEITEM_TEXT_PARTITIONED_HIVE_STRING PARTITION (year)
SELECT
    l_orderkey,
    l_partkey,
    l_suppkey,
    l_linenumber,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax,
    l_returnflag,
    l_linestatus,
    l_shipdate,
    l_commitdate,
    l_receiptdate,
    l_shipinstruct,
    l_shipmode,
    l_comment,
    year
FROM DEFAULT.LINEITEM_TEXT_PARTITIONED_HIVE_STRING;

DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive_string;
CREATE TABLE IF NOT EXISTS lineitem_parquet_partitioned_hive_string (
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
PARTITIONED BY (year STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/dynamic_partition_lineitempart_string";

INSERT OVERWRITE TABLE dynamic_partitions.lineitem_parquet_partitioned_hive_string PARTITION (year)
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
    year
FROM DEFAULT.lineitem_parquet_partitioned_hive_string;

SET hive.exec.dynamic.partition.mode=strict;
