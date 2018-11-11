alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

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

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;