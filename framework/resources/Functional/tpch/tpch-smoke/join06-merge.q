alter session set `planner.enable_hashjoin` = false;
select count(*)  
  from supplier s 
	join lineitem l on s.s_suppkey = l.l_suppkey 
    join orders o on o.o_orderkey = l.l_orderkey
   where l.l_shipdate between date '1995-01-01' and date '1995-12-31' ;
alter session set `planner.enable_hashjoin` = true;
