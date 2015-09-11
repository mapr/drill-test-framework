select
  columns[8],
  columns[9],
  sum(cast(columns[4] as double)) as sum_qty,
  sum(cast(columns[5] as double)) as sum_base_price,
  sum(cast(columns[5] as double) * (1 - cast(columns[6] as double))) as sum_disc_price,
  sum(cast(columns[5] as double) * (1 - cast(columns[6] as double)) * (1 + cast(columns[7] as double))) as sum_charge,
  avg(cast(columns[4] as double)) as avg_qty,
  avg(cast(columns[5] as double)) as avg_price,
  avg(cast(columns[6] as double)) as avg_disc,
  count(*) as count_order
from
  `lineitem.tbl`
where
  columns[10] <= date '1998-12-01' - interval '120' day (3)
group by
  columns[8],
  columns[9]
order by
  columns[8],
  columns[9];
