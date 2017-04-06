explain plan for select
  sum(l_extendedprice * l_discount) as revenue
from
  l_3level
where
  dir0=2 and dir1='one' and dir2= date '2015-7-12' and
  l_shipdate >= date '1997-01-01'
  and l_shipdate < date '1997-01-01' + interval '1' year
  and
  l_discount between 0.03 - 0.01 and 0.03 + 0.01
  and l_quantity < 24;
