create or replace view nation_decimal_09 as select cast(columns[0] as int) n_nationkey, columns[1] n_name, cast(columns[2] as int) n_regionkey, columns[3] n_comment from `nation.tbl`;
create or replace view region_decimal_09 as select cast(columns[0] as int) r_regionkey, columns[1] r_name, columns[2] r_comment from `region.tbl`;
create or replace view part_decimal_09 as select cast(columns[0] as int) p_partkey, columns[1] p_name, columns[2] p_mfgr, columns[3] p_brand, columns[4] p_type, cast(columns[5] as int) p_size, columns[6] p_container, cast(columns[7] as decimal(15,2)) p_retailprice, columns[8] p_comment from `part.tbl`;
create or replace view supplier_decimal_09 as select cast(columns[0] as int) s_suppkey, columns[1] s_name, columns[2] s_address, cast(columns[3] as int) s_nationkey, columns[4] s_phone, cast(columns[5] as decimal(15,2)) s_acctbal, columns[6] s_comment from `supplier.tbl`;
create or replace view partsupp_decimal_09 as select cast(columns[0] as int) ps_partkey, cast(columns[1] as int) ps_suppkey, cast(columns[2] as int) ps_availqty, cast(columns[3] as decimal(15,2)) ps_supplycost, columns[4] ps_comment from `partsupp.tbl`;
create or replace view customer_decimal_09 as select cast(columns[0] as int) c_custkey, columns[1] c_name, columns[2] c_address, cast(columns[3] as int) c_nationkey, columns[4] c_phone, cast(columns[5] as decimal(15,2)) c_acctbal, columns[6] c_mktsegment, columns[7] c_comment from `customer.tbl`;
create or replace view orders_decimal_09 as select cast(columns[0] as int) o_orderkey, cast(columns[1] as int) o_custkey, columns[2] o_orderstatus, cast(columns[3] as decimal(15,2)) o_totalprice, cast(columns[4] as date)o_orderdate, columns[5] o_orderpriority, columns[6] o_clerk, cast(columns[7] as int) o_shippriority, columns[8] o_comment from `orders.tbl`;
create or replace view lineitem_decimal_09 as select cast(columns[0] as int) l_orderkey, cast(columns[1] as int) l_partkey, cast(columns[2] as int) l_suppkey, cast(columns[3] as int) l_linenumber, cast(columns[4] as decimal(15,2)) l_quantity, cast(columns[5] as decimal(15,2)) l_extendedprice, cast(columns[6] as decimal(15,2)) l_discount, cast(columns[7] as decimal(15,2)) l_tax, columns[8] l_returnflag, columns[9] l_linestatus, cast(columns[10] as date) l_shipdate, cast(columns[11] as date) l_commitdate, cast(columns[12] as date) l_receiptdate, columns[13] l_shipinstruct, columns[14] l_shipmode, columns[15] l_comment from `lineitem.tbl`;
select
  nation,
  o_year,
  sum(amount) as sum_profit
from
  (
    select
      n.n_name as nation,
      extract(year from o.o_orderdate) as o_year,
      l.l_extendedprice * (1 - l.l_discount) - ps.ps_supplycost * l.l_quantity as amount
    from
      part_decimal_09 p,
      supplier_decimal_09 s,
      lineitem_decimal_09 l,
      partsupp_decimal_09 ps,
      orders_decimal_09 o,
      nation_decimal_09 n
    where
      s.s_suppkey = l.l_suppkey
      and ps.ps_suppkey = l.l_suppkey
      and ps.ps_partkey = l.l_partkey
      and p.p_partkey = l.l_partkey
      and o.o_orderkey = l.l_orderkey
      and s.s_nationkey = n.n_nationkey
      and p.p_name like '%yellow%'
  ) as profit
group by
  nation,
  o_year
order by
  nation,
  o_year desc;
drop view nation_decimal_09;
drop view region_decimal_09;
drop view part_decimal_09;
drop view supplier_decimal_09;
drop view partsupp_decimal_09;
drop view customer_decimal_09;
drop view orders_decimal_09;
drop view lineitem_decimal_09;
