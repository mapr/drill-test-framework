create table `tpch_single_partition1/lineitem` partition by (c1) as select l.*, l_shipdate - extract(day from l_shipdate) + 1 + time '05:30:44.800' as c1 from cp.`tpch/lineitem.parquet` l;
create table `tpch_single_partition1/orders` partition by (c1) as SELECT o.*, case when `year`(o_orderdate) > 1995 then interval '1 2' day to hour else interval '1 19:30:45' day to second end as c1 from cp.`tpch/orders.parquet` o;
create table `tpch_single_partition1/partsupp`  partition by (c1) as select ps.*, case when ps_partkey > 1000 then interval '1-2' year to month else interval '1' year end as c1 from cp.`tpch/partsupp.parquet` ps;
create table `tpch_single_partition1/part` partition by (p_mfgr) as select * from cp.`tpch/part.parquet`;
create table `tpch_single_partition1/supplier` partition by (dbl_nationkey) as select s.*, cast(s_nationkey as double) dbl_nationkey from cp.`tpch/supplier.parquet` s;
create table `tpch_single_partition1/nation` partition by (n_regionkey) as select * from cp.`tpch/nation.parquet` n;
create table `tpch_single_partition1/region` partition by (c1) as select r.*, case when r_regionkey < 3 then time '12:12:12.12' else time '14:13:12.00' end c1 from cp.`tpch/region.parquet` r;
create table `tpch_single_partition1/customer` partition by (c_bool) as select c.*, case when c_mktsegment = 'MACHINERY' then true else false end as c_bool from cp.`tpch/customer.parquet` c;
create table `tpch_single_partition1/drill4449` partition by (l_discount) as select * from cp.`tpch/lineitem.parquet`;

refresh table metadata `tpch_single_partition1/drill4449`;
