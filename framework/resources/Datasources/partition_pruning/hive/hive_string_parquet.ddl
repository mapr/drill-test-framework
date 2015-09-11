SET hive.exec.dynamic.partition.mode=nonstrict;

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
