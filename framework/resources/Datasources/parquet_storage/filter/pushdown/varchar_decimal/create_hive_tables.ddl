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
location 'dfs_location/customer';

drop table if exists filter_pushdown.part_old;
create external table filter_pushdown.part_old(
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
location 'dfs_location/part_old';

drop table if exists filter_pushdown.partsupp_old;
create external table filter_pushdown.partsupp_old(
  ps_partkey int,
  ps_suppkey int,
  ps_availqty int,
  ps_supplycost decimal(6,2),
  ps_comment string
)
stored as parquet
location 'dfs_location/partsupp_old';