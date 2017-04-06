select l_quantity from l_3level where dir0=1 and dir1 in ('one', 'three') and dir2 = '2015-7-12' and l_discount=0.07 order by l_orderkey limit 10;
