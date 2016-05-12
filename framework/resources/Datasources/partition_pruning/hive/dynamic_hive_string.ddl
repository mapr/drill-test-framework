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
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/dynamic_partition_lineitempart";

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
PARTITIONED BY (year STRING) STORED AS PARQUET;

FROM lineitem_text_partitioned_hive_string
insert overwrite table lineitem_parquet_partitioned_hive_string partition(year) select *;

SET hive.exec.dynamic.partition.mode=strict;

