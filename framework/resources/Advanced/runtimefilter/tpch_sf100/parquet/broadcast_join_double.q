alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

select
  count(*) as row_count
from
  orders o
where
  o.o_totalprice = (
    select
      max(l.l_extendedprice)
    from
      lineitem l);

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;