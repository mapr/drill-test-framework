alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

select
  avg(l1.l_extendedprice) as avg_cost_for_mode
from
  lineitem l1,
  (select
    cast(l2.l_shipmode as varchar) as least_used_ship_mode,
    count(*) as num_items
  from
    lineitem l2
  group by
    l2.l_shipmode
  order by
    num_items
  limit 1) as l3
where
  l1.l_shipmode = l3.least_used_ship_mode;

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;