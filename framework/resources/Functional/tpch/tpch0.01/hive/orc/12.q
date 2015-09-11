-- tpch12 using 1395599672 as a seed to the RNG
select
  l.l_shipmode,
  sum(case
    when o.o_orderpriority = '1-URGENT'
      or o.o_orderpriority = '2-HIGH'
      then 1
    else 0
  end) as high_line_count,
  sum(case
    when o.o_orderpriority <> '1-URGENT'
      and o.o_orderpriority <> '2-HIGH'
      then 1
    else 0
  end) as low_line_count
from
  orders o,
  lineitem l
where
  o.o_orderkey = l.l_orderkey
  and l.l_shipmode in ('TRUCK', 'REG AIR')
  and cast(l.l_commitdate as date) < cast(l.l_receiptdate as date)
  and cast(l.l_shipdate as date) < cast(l.l_commitdate as date)
  and cast(l.l_receiptdate as date) >= date '1994-01-01'
  and cast(l.l_receiptdate as date) < date '1994-01-01' + interval '1' year
group by
  l.l_shipmode
order by
  l.l_shipmode;
