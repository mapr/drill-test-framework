ALTER TABLE add_columns1 ADD COLUMNS (
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
);

ALTER TABLE remove_columns1 REPLACE COLUMNS (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string
);

ALTER TABLE add_columns2 ADD COLUMNS (
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
);

ALTER TABLE remove_columns2 REPLACE COLUMNS (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string
);


ALTER TABLE modify_columntypes1 REPLACE COLUMNS (
  int_col string,
  bigint_col varchar(50),
  date_col date,
  time_col string,
  timestamp_col varchar(20),
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
);

ALTER TABLE modify_columntypes2 REPLACE COLUMNS (
  int_col float,
  bigint_col bigint,
  date_col varchar(15),
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col varchar(5),
  float_col string,
  double_col double,
  bool_col boolean
);

alter table seq_modify_columntypes1 replace columns (
    l_orderkey float,
    l_partkey double,
    l_suppkey varchar(1),
    l_linenumber string,
    l_quantity double,
    l_extendedprice double,
    l_discount double,
    l_tax varchar(20),
    l_returnflag string,
    l_linestatus string,
    l_shipdate date,
    l_commitdate string,
    l_receiptdate date,
    l_shipinstruct varchar(2),
    l_shipmode string,
    l_comment double
);
ALTER TABLE dpp_compressed_mktevents ADD COLUMNS (newcol STRING);

ALTER TABLE changemetadata_orders_partitioned ADD COLUMNS (
  o_clerk STRING,
  o_shippriority INT, 
  o_comment STRING
);

ALTER TABLE changemetadata_orders_partitioned ADD PARTITION (year=1997) location '/drill/testdata/hive_storage/orders_partitioned/1997';

ALTER TABLE changemetadata_orders_partitioned1 replace columns (
    o_orderkey INT,
    o_custkey INT
);

ALTER TABLE changemetadata_orders_partitioned1 add columns (
    o_orderdate STRING,
    o_orderpriority STRING,
    o_clerk STRING,
    o_shippriority INT,
    o_comment STRING
);

ALTER TABLE changemetadata_orders_partitioned1 DROP IF EXISTS PARTITION(year=1994);


ALTER TABLE changemetadata_orders_partitioned2 replace columns (
    o_orderkey FLOAT,
    o_custkey STRING,
    o_orderstatus STRING,
    o_totalprice DOUBLE,
    o_orderdate STRING,
    o_orderpriority VARCHAR(1),
    o_clerk DOUBLE,
    o_shippriority INT
);
ALTER TABLE changemetadata_orders_partitioned2 DROP IF EXISTS PARTITION(year=1990);
