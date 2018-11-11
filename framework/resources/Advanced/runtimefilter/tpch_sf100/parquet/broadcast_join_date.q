alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

select
  count(*) as row_count
from
  lineitem l1
where
  l1.l_shipdate IN (
    select
      distinct(cast(l2.l_shipdate as date)) as distinctdates
    from
      lineitem l2
    order by
      distinctdates desc
    limit 10);

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;