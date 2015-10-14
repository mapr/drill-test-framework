DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive_hier_intint;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_parquet_partitioned_hive_hier_intint (
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
PARTITIONED BY (year int, month int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint";

--- 1991 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1991/12';

--- 1992 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1992/12';

--- 1993 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1993/12';

--- 1994 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1994/12';

--- 1995 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1995/12';

--- 1996 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1996/12';

--- 1997 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=1) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/1';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=2) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/2';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=3) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/3';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=4) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/4';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=5) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/5';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=6) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/6';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=7) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/7';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=8) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/8';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=9) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/9';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=10) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/10';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=11) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/11';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=12) location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intint/1997/12';
