select
  supp_nation,
  cust_nation,
  l_year,
  sum(volume) as revenue
from
  (
    select
      n1.columns[1] as supp_nation,
      n2.columns[1] as cust_nation,
      extract(year from cast(l.columns[10] as date)) as l_year,
      cast(l.columns[5] as double) * (1 - cast(l.columns[6] as double)) as volume
    from
      `supplier.tbl` s,
      `lineitem.tbl` l,
      `orders.tbl` o,
      `customer.tbl` c,
      `nation.tbl` n1,
      `nation.tbl` n2
    where
      s.columns[0] = l.columns[2]
      and o.columns[0] = l.columns[0]
      and c.columns[0] = o.columns[1]
      and s.columns[3] = n1.columns[0]
      and c.columns[3] = n2.columns[0]
      and (
        (n1.columns[1] = 'EGYPT' and n2.columns[1] = 'UNITED STATES')
        or (n1.columns[1] = 'UNITED STATES' and n2.columns[1] = 'EGYPT')
      )
      and cast(l.columns[10] as date) between date '1995-01-01' and date '1996-12-31'
  ) as shipping
group by
  supp_nation,
  cust_nation,
  l_year
order by
  supp_nation,
  cust_nation,
  l_year;
