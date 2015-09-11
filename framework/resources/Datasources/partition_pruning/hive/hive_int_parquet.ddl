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
