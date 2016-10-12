alter session set `planner.enable_mergejoin` = false;
select count(*) 
  from (select l.l_orderkey, c.c_custkey 
	from lineitem l 
        left outer join customer c 
             on l.l_orderkey = c.c_custkey) as foo;
alter session set `planner.enable_mergejoin` = true;
