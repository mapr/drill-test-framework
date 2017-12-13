DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive;
CREATE EXTERNAL TABLE lineitem_parquet_partitioned_hive (
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
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/lineitempart";

ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1991) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1991';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1992) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1992';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1993) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1993';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1994) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1994';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1995) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1995';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1996) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1996';
ALTER TABLE lineitem_parquet_partitioned_hive ADD PARTITION (year=1997) location '/drill/testdata/partition_pruning/hive/parquet/lineitempart/1997';

DROP TABLE IF EXISTS orders_parquet_partitioned_hive;
CREATE EXTERNAL TABLE orders_parquet_partitioned_hive (
    o_orderkey INT,
    o_custkey INT,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate STRING,
    o_orderpriority STRING,
    o_clerk STRING,
    o_shippriority INT,
    o_comment STRING
)
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/orderspart";

--- ADD PARTITIONS ----
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1990) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1990';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1991) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1991';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1992) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1992';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1993) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1993';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1994) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1994';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1995) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1995';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1996) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1996';
ALTER TABLE orders_parquet_partitioned_hive ADD PARTITION (year=1997) location '/drill/testdata/partition_pruning/hive/parquet/orderspart/1997';

-- Hive dynamic partitions

SET hive.exec.dynamic.partition.mode=true;

CREATE DATABASE IF NOT EXISTS dynamic_partitions;
USE dynamic_partitions;

DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive;
CREATE TABLE lineitem_parquet_partitioned_hive (
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
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/dynamic_partition_lineitempart_int";

INSERT OVERWRITE TABLE dynamic_partitions.lineitem_parquet_partitioned_hive PARTITION (year)
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
FROM DEFAULT.lineitem_parquet_partitioned_hive;

SET hive.exec.dynamic.partition.mode=true;
