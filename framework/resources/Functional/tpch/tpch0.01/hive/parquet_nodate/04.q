-- tpch4 using 1395599672 as a seed to the RNG
select
  o.o_orderpriority,
  count(*) as order_count
from
  orders o
where
  cast(o.o_orderdate as date) >= date '1996-10-01'
  and cast(o.o_orderdate as date) < date '1996-10-01' + interval '3' month
  and 
  exists (
    select
      *
    from
      lineitem l
    where
      l.l_orderkey = o.o_orderkey
      and cast(l.l_commitdate as date) < cast(l.l_receiptdate as date)
  )
group by
  o.o_orderpriority
order by
  o.o_orderpriority;
