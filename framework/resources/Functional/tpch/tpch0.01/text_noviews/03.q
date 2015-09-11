select
  l.columns[0],
  sum(cast(l.columns[5] as double) * (1 - cast(l.columns[6] as double))) as revenue,
  o.columns[4],
  o.columns[7]
from
  `customer.tbl` c,
  `orders.tbl` o,
  `lineitem.tbl` l
where
  c.columns[6] = 'HOUSEHOLD'
  and c.columns[0] = o.columns[1]
  and l.columns[0] = o.columns[0]
  and o.columns[4] < date '1995-03-25'
  and l.columns[10] > date '1995-03-25'
group by
  l.columns[0],
  o.columns[4],
  o.columns[7]
order by
  revenue desc,
  o.columns[4]
limit 10;
