set `exec.hashjoin.enable.runtime_filter` = true;
set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;
set `planner.enable_broadcast_join` = true;
set `planner.broadcast_threshold` = 10000000;

select
  l.l_orderkey,
  round(sum(l.l_extendedprice * (1 - l.l_discount)), 3) as revenue,
  o.o_orderdate,
  o.o_shippriority
from
  customer c,
  orders o,
  lineitem l
where
  c.c_mktsegment = 'HOUSEHOLD'
  and c.c_custkey = o.o_custkey
  and l.l_orderkey = o.o_orderkey
  and o.o_orderdate < date '1995-03-25'
  and l.l_shipdate > date '1995-03-25'
group by
  l.l_orderkey,
  o.o_orderdate,
  o.o_shippriority
order by
  revenue desc,
  o.o_orderdate
limit 10;

reset `exec.hashjoin.enable.runtime_filter`;
reset `exec.hashjoin.runtime_filter.max.waiting.time`;
reset `planner.enable_broadcast_join`;
reset `planner.broadcast_threshold`;