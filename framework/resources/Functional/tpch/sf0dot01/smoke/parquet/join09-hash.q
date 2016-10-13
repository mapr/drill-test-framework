alter session set `planner.enable_mergejoin` = false;
select count(*) 
  from (select l.l_orderkey as x, c.c_custkey as y 
	from lineitem l 
    	left outer join customer c 
			on l.l_orderkey = c.c_custkey) as foo
  where y < 10000;
alter session set `planner.enable_mergejoin` = true;
