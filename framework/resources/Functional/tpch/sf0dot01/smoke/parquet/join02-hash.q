alter session set `planner.enable_mergejoin` = false;
select count(*)
  from (select c.c_custkey
	from customer c, orders o
	where c.c_custkey = o.o_custkey) as foo;
alter session set `planner.enable_mergejoin` = true;
