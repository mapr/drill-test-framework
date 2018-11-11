alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

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

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;