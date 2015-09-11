alter session set `planner.enable_hashjoin` = false;
select count(*) 
   from (select l.l_quantity 
	from lineitem l, partsupp ps 
		where l.l_partkey = ps.ps_partkey 
        and l.l_suppkey = ps.ps_suppkey) as foo;
alter session set `planner.enable_hashjoin` = true;
