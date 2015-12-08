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
