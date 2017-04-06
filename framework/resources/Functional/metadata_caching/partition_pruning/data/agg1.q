select
  sum(l_extendedprice * l_discount) as revenue
from
  l_3level
where
  dir0=2 and dir1='one' and dir2 between date '2015-7-12' and date '2015-8-15'
  and l_discount between 0.03 - 0.01 and 0.03 + 0.01;

