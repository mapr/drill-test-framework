set `exec.hashjoin.enable.runtime_filter` = true;
set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;
set `planner.enable_broadcast_join` = true;
set `planner.broadcast_threshold` = 2147483647;

select
  count(*) as row_count
from (
  select *
  from
    lineitem l,
    supplier s
  where
    s.s_suppkey = l.l_suppkey
    and s.s_acctbal < 1000);

reset `exec.hashjoin.enable.runtime_filter`;
reset `exec.hashjoin.runtime_filter.max.waiting.time`;
reset `planner.enable_broadcast_join`;
reset `planner.broadcast_threshold`;
