alter session set `planner.enable_hashagg` = false;
select sum(l_extendedprice * l_discount) as revenue 
   from lineitem 
	where l_shipdate between date '1997-01-01' and date '1998-01-01' 
		and l_quantity < 24 ;
alter session set `planner.enable_hashagg` = true;
