select o_orderkey, dir0, dir1 from o_2level where cast(dir0 as int) = 1991 and dir1 = 'feb' order by o_orderkey limit 2;
