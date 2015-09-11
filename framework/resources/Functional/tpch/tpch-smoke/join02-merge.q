alter session set `planner.enable_hashjoin` = false;
select count(*)
  from (select c.c_custkey
	from customer c, orders o
	where c.c_custkey = o.o_custkey) as foo;
alter session set `planner.enable_hashjoin` = true;
