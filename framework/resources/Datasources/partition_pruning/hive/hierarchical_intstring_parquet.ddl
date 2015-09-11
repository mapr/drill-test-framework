DROP TABLE IF EXISTS lineitem_parquet_partitioned_hive_hier_intstring;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_parquet_partitioned_hive_hier_intstring (
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
PARTITIONED BY (year int, month string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS PARQUET LOCATION "/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring";

--- 1991 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1991/dec';

--- 1992 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1992/dec';

--- 1993 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1993/dec';

--- 1994 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1994/dec';

--- 1995 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1995/dec';

--- 1996 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1996/dec';

--- 1997 partitions ----
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jan') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/jan';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='feb') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/feb';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='mar') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/mar';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='apr') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/apr';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='may') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/may';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jun') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/jun';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jul') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/jul';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='aug') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/aug';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='sep') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/sep';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='oct') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/oct';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='nov') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/nov';
ALTER TABLE lineitem_parquet_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='dec') location '/drill/testdata/partition_pruning/hive/parquet/lineitem_hierarchical_intstring/1997/dec';
