-- creating dynamic partitions over DATE is not supported in hive1.0

SET hive.exec.dynamic.partition.mode=nonstrict;

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