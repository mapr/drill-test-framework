create table `tpch_single_partition/lineitem` partition by (l_moddate) as select l.*, l_shipdate - extract(day from l_shipdate) + 1 l_moddate from cp.`tpch/lineitem.parquet` l;
create table `tpch_single_partition/orders` partition by (o_decimal) as select o.*, cast(case when o_orderpriority = '5-LOW' then 2.8 else 2 end as decimal(5,2)) o_decimal from cp.`tpch/orders.parquet` o;
create table `tpch_single_partition/partsupp` partition by (ps_partkey_int) as select ps.*, cast(ps_partkey as int) ps_partkey_int from cp.`tpch/partsupp.parquet` ps;
create table `tpch_single_partition/part` partition by (p_mfgr) as select * from cp.`tpch/part.parquet`;
create table `tpch_single_partition/supplier` partition by (dbl_nationkey) as select s.*, cast(s_nationkey as double) dbl_nationkey from cp.`tpch/supplier.parquet` s;
create table `tpch_single_partition/nation` partition by (n_rgnkey_float) as select n.*, cast(n_regionkey as float) n_rgnkey_float from cp.`tpch/nation.parquet` n;
create table `tpch_single_partition/region` partition by (r_regionkey_bigint) as select r.*, cast(r_regionkey+10000000000 as bigint) r_regionkey_bigint from cp.`tpch/region.parquet` r;
create table `tpch_single_partition/customer` partition by (binary_mktsegment) as select c.*, encode(c_mktsegment, 'UTF-8') binary_mktsegment from cp.`tpch/customer.parquet` c;
