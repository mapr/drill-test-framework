select o_orderkey, dir0, dir1 from o_2level where dir0=1991 and (dir1 = 'feb' or dir1 = 'jan') and o_orderdate = date '1996-01-02';
