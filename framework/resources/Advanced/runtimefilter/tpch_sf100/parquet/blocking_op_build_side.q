alter session set `exec.hashjoin.enable.runtime_filter` = true;
alter session set `exec.hashjoin.runtime_filter.max.waiting.time` = 10000;

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

alter session reset `exec.hashjoin.enable.runtime_filter`;
alter session reset `exec.hashjoin.runtime_filter.max.waiting.time`;