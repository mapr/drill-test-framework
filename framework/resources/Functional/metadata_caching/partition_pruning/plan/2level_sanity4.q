explain plan for select o_orderkey from o_2level where dir0=extract(year from date '1991-01-02') and (dir1 = 'feb' or dir1 = 'jan') and o_orderdate = date '1996-01-02';
