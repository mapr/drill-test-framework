alter session set `planner.enable_hashjoin` = false;
select count(*)  
  from supplier s, lineitem l, orders o 
	where s.s_suppkey = l.l_suppkey 
		and o.o_orderkey = l.l_orderkey 
    	and l.l_shipdate between date '1995-01-01' and date '1995-12-31' ;
alter session set `planner.enable_hashjoin` = true;
