select l_orderkey, dir0 from `l_3level/1/one/2015-7-12` t1
  union all 
  select l_orderkey, dir0 from l_3level t2 where t2.dir0 = 1 and t2.dir1='two' and t2.dir2 = '2015-8-12' and (t2.l_discount < 0.02 or t2.l_discount > 0.07);
