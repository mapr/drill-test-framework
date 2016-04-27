select sum(s.revenue), count(*) from (
  select
    l.l_orderkey,
    sum(l.l_extendedprice * (1 - l.l_discount)) as revenue,
    o.o_orderdate,
    o.o_shippriority
  from
    dfs.concurrency.customer c,
    dfs.concurrency.orders o,
    dfs.concurrency.lineitem l
  where
    c.c_mktsegment = 'HOUSEHOLD'
    and c.c_custkey = o.o_custkey
    and l.l_orderkey = o.o_orderkey
  group by
    l.l_orderkey,
    o.o_orderdate,
    o.o_shippriority) s;
