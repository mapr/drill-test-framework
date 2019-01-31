create database if not exists filter_pushdown;

drop table if exists filter_pushdown.customer;
create external table filter_pushdown.customer(
  c_custkey int,
  c_name string,
  c_address string,
  c_nationkey int,
  c_phone string,
  c_acctbal decimal(6,2),
  c_mktsegment string,
  c_comment string
)
stored as parquet
location 'dfs_location/1.16.0/customer';

drop table if exists filter_pushdown.part;
create external table filter_pushdown.part(
  p_partkey int,
  p_name string,
  p_mfgr string,
  p_brand string,
  p_type string,
  p_size int,
  p_container string,
  p_retailprice bigint,
  p_comment string
)
stored as parquet
location 'dfs_location/1.14.0/part';

drop table if exists filter_pushdown.partsupp;
create external table filter_pushdown.partsupp(
  ps_partkey int,
  ps_suppkey int,
  ps_availqty int,
  ps_supplycost decimal(6,2),
  ps_comment string
)
stored as parquet
location 'dfs_location/1.14.0/partsupp';