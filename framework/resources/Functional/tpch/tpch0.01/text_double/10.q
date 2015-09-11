create or replace view nation_double_10 as select cast(columns[0] as int) n_nationkey, columns[1] n_name, cast(columns[2] as int) n_regionkey, columns[3] n_comment from `nation.tbl`;
create or replace view region_double_10 as select cast(columns[0] as int) r_regionkey, columns[1] r_name, columns[2] r_comment from `region.tbl`;
create or replace view part_double_10 as select cast(columns[0] as int) p_partkey, columns[1] p_name, columns[2] p_mfgr, columns[3] p_brand, columns[4] p_type, cast(columns[5] as int) p_size, columns[6] p_container, cast(columns[7] as double) p_retailprice, columns[8] p_comment from `part.tbl`;
create or replace view supplier_double_10 as select cast(columns[0] as int) s_suppkey, columns[1] s_name, columns[2] s_address, cast(columns[3] as int) s_nationkey, columns[4] s_phone, cast(columns[5] as double) s_acctbal, columns[6] s_comment from `supplier.tbl`;
create or replace view partsupp_double_10 as select cast(columns[0] as int) ps_partkey, cast(columns[1] as int) ps_suppkey, cast(columns[2] as int) ps_availqty, cast(columns[3] as double) ps_supplycost, columns[4] ps_comment from `partsupp.tbl`;
create or replace view customer_double_10 as select cast(columns[0] as int) c_custkey, columns[1] c_name, columns[2] c_address, cast(columns[3] as int) c_nationkey, columns[4] c_phone, cast(columns[5] as double) c_acctbal, columns[6] c_mktsegment, columns[7] c_comment from `customer.tbl`;
create or replace view orders_double_10 as select cast(columns[0] as int) o_orderkey, cast(columns[1] as int) o_custkey, columns[2] o_orderstatus, cast(columns[3] as double) o_totalprice, cast(columns[4] as date)o_orderdate, columns[5] o_orderpriority, columns[6] o_clerk, cast(columns[7] as int) o_shippriority, columns[8] o_comment from `orders.tbl`;
create or replace view lineitem_double_10 as select cast(columns[0] as int) l_orderkey, cast(columns[1] as int) l_partkey, cast(columns[2] as int) l_suppkey, cast(columns[3] as int) l_linenumber, cast(columns[4] as double) l_quantity, cast(columns[5] as double) l_extendedprice, cast(columns[6] as double) l_discount, cast(columns[7] as double) l_tax, columns[8] l_returnflag, columns[9] l_linestatus, cast(columns[10] as date) l_shipdate, cast(columns[11] as date) l_commitdate, cast(columns[12] as date) l_receiptdate, columns[13] l_shipinstruct, columns[14] l_shipmode, columns[15] l_comment from `lineitem.tbl`;
select
  c.c_custkey,
  c.c_name,
  sum(l.l_extendedprice * (1 - l.l_discount)) as revenue,
  c.c_acctbal,
  n.n_name,
  c.c_address,
  c.c_phone,
  c.c_comment
from
  customer_double_10 c,
  orders_double_10 o,
  lineitem_double_10 l,
  nation_double_10 n
where
  c.c_custkey = o.o_custkey
  and l.l_orderkey = o.o_orderkey
  and o.o_orderdate >= date '1994-03-01'
  and o.o_orderdate < date '1994-03-01' + interval '3' month
  and l.l_returnflag = 'R'
  and c.c_nationkey = n.n_nationkey
group by
  c.c_custkey,
  c.c_name,
  c.c_acctbal,
  c.c_phone,
  n.n_name,
  c.c_address,
  c.c_comment
order by
  revenue desc
limit 20;
drop view nation_double_10;
drop view region_double_10;
drop view part_double_10;
drop view supplier_double_10;
drop view partsupp_double_10;
drop view customer_double_10;
drop view orders_double_10;
drop view lineitem_double_10;
