create database if not exists droptable;
create external table if not exists droptable.droptableif19_parquet (
  c_row int,
  c_groupby string,
  c_int int,
  c_bigint bigint,
  c_float4 float,
  c_float8 double
)
STORED AS PARQUET
LOCATION '/drill/testdata/droptable/droptableif19';
