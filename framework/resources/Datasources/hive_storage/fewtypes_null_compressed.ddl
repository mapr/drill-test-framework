drop table if exists fewtypes_null_compressed_gz;
create external table fewtypes_null_compressed_gz (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/hive_storage/fewtypes_null_gz'
TBLPROPERTIES ("serialization.null.format"="null");

drop table if exists fewtypes_null_compressed_bz2;
create external table fewtypes_null_compressed_bz2 (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
LOCATION '/drill/testdata/hive_storage/fewtypes_null_bz2'
TBLPROPERTIES ("serialization.null.format"="null");


drop table if exists fewtypes_null_compressed_rc_snappy;
create external table fewtypes_null_compressed_rc_snappy (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
STORED AS rcfile
LOCATION '/drill/testdata/hive_storage/fewtypes_null_rc_snappy';

SET hive.exec.compress.output=true;
SET mapred.output.compression.type=BLOCK;
SET SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;

INSERT OVERWRITE TABLE fewtypes_null_compressed_rc_snappy select * from fewtypes_null_compressed_gz;

drop table if exists fewtypes_null_compressed_seq_snappy;
create external table fewtypes_null_compressed_seq_snappy (
  int_col int,
  bigint_col bigint,
  date_col date,
  time_col string,
  timestamp_col timestamp,
  interval_col string,
  varchar_col string,
  float_col float,
  double_col double,
  bool_col boolean
)
STORED AS sequencefile
LOCATION '/drill/testdata/hive_storage/fewtypes_null_seq_snappy';

INSERT OVERWRITE TABLE fewtypes_null_compressed_seq_snappy select * from fewtypes_null_compressed_gz;
