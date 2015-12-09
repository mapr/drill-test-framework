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
  date_col int,
  time_col bigint,
  timestamp_col varchar(20),
  interval_col date,
  varchar_col int,
  float_col int,
  double_col float,
  bool_col int
);

ALTER TABLE modify_columntypes2 REPLACE COLUMNS (
  int_col float,
  bigint_col int,
  date_col varchar(15),
  time_col timestamp,
  timestamp_col date,
  interval_col boolean,
  varchar_col varchar(5),
  float_col string,
  double_col bigint,
  bool_col float
);

alter table seq_modify_columntypes1 replace columns (
    l_orderkey float,
    l_partkey double,
    l_suppkey varchar(1),
    l_linenumber string,
    l_quantity bigint,
    l_extendedprice int,
    l_discount float,
    l_tax varchar(20),
    l_returnflag boolean,
    l_linestatus int,
    l_shipdate timestamp,
    l_commitdate string,
    l_receiptdate int,
    l_shipinstruct varchar(2),
    l_shipmode boolean,
    l_comment double
);
