set `exec.hashjoin.enable.runtime_filter` = true;
set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;
set `planner.enable_broadcast_join` = false;

select
  count(*) as row_count
from (
  select *
  from
    lineitem l,
    orders o
  where
    o.o_orderkey = l.l_orderkey
    and o.o_totalprice < 100000);

reset `exec.hashjoin.enable.runtime_filter`;
reset `exec.hashjoin.runtime_filter.max.waiting.time`;
reset `planner.enable_broadcast_join`;