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
