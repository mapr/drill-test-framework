set `exec.hashjoin.enable.runtime_filter` = true;
set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;
set `planner.enable_broadcast_join` = false;
set `planner.enable_semijoin` = false;

select
  l.l_shipdate,
  sum(l.l_quantity) as total_quantity
from
  lineitem l
where
  l.l_shipdate in (
    select
      distinct(o.o_orderdate)
    from
      orders o
    where
      o.o_orderpriority = '1-URGENT')
group by
  l.l_shipdate
order by
  total_quantity desc
limit 10;

reset `exec.hashjoin.enable.runtime_filter`;
reset `exec.hashjoin.runtime_filter.max.waiting.time`;
reset `planner.enable_broadcast_join`;
reset `planner.enable_semijoin`;
