set `exec.hashjoin.enable.runtime_filter` = true;
set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;
set `planner.enable_broadcast_join` = false;

select
  count(*) as row_count
from
  lineitem l1
where
  l1.l_shipdate IN (
    select
      distinct(cast(l2.l_shipdate as date))
    from
      lineitem l2);

reset `exec.hashjoin.enable.runtime_filter`;
reset `exec.hashjoin.runtime_filter.max.waiting.time`;
reset `planner.enable_broadcast_join`;