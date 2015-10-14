DROP TABLE IF EXISTS orders_text_partitioned_hive;
CREATE EXTERNAL TABLE orders_text_partitioned_hive (
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
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/orderspart";

--- ADD PARTITIONS ----
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1990) location '/drill/testdata/partition_pruning/hive/text/orderspart/1990';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1991) location '/drill/testdata/partition_pruning/hive/text/orderspart/1991';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1992) location '/drill/testdata/partition_pruning/hive/text/orderspart/1992';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1993) location '/drill/testdata/partition_pruning/hive/text/orderspart/1993';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1994) location '/drill/testdata/partition_pruning/hive/text/orderspart/1994';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1995) location '/drill/testdata/partition_pruning/hive/text/orderspart/1995';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1996) location '/drill/testdata/partition_pruning/hive/text/orderspart/1996';
ALTER TABLE orders_text_partitioned_hive ADD PARTITION (year=1997) location '/drill/testdata/partition_pruning/hive/text/orderspart/1997';


DROP TABLE IF EXISTS lineitem_text_hive;
CREATE EXTERNAL TABLE lineitem_text_hive (
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
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitem";


DROP TABLE IF EXISTS lineitem_text_partitioned_hive;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_text_partitioned_hive (
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
PARTITIONED BY (year INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitempart";

ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1991) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1991';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1992) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1992';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1993) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1993';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1994) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1994';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1995) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1995';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1996) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1996';
ALTER TABLE lineitem_text_partitioned_hive ADD PARTITION (year=1997) location '/drill/testdata/partition_pruning/hive/text/lineitempart/1997';


-----------------
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




DROP TABLE IF EXISTS lineitem_text_partitioned_hive_hier_intstring;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_text_partitioned_hive_hier_intstring (
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
PARTITIONED BY (year int, month string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring";

--- 1991 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1991, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1991/dec';

--- 1992 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1992, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1992/dec';

--- 1993 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1993, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1993/dec';

--- 1994 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1994, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1994/dec';

--- 1995 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1995, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1995/dec';

--- 1996 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1996, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1996/dec';

--- 1997 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jan') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/jan';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='feb') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/feb';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='mar') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/mar';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='apr') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/apr';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='may') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/may';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jun') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/jun';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='jul') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/jul';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='aug') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/aug';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='sep') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/sep';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='oct') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/oct';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='nov') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/nov';
ALTER TABLE lineitem_text_partitioned_hive_hier_intstring ADD PARTITION (year=1997, month='dec') location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intstring/1997/dec';


DROP TABLE IF EXISTS lineitem_text_partitioned_hive_hier_intint;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem_text_partitioned_hive_hier_intint (
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
PARTITIONED BY (year int, month int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE LOCATION "/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint";

ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1991, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1991/12';

--- 1992 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1992, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1992/12';

--- 1993 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1993, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1993/12';

--- 1994 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1994, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1994/12';

--- 1995 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1995, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1995/12';

--- 1996 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1996, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1996/12';

--- 1997 partitions ----
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=1) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/1';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=2) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/2';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=3) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/3';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=4) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/4';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=5) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/5';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=6) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/6';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=7) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/7';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=8) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/8';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=9) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/9';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=10) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/10';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=11) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/11';
ALTER TABLE lineitem_text_partitioned_hive_hier_intint ADD PARTITION (year=1997, month=12) location '/drill/testdata/partition_pruning/hive/text/lineitem_hierarchical_intint/1997/12';
