select c.c_custkey 
  from customer c 
  where c.c_custkey in (select o.o_custkey 
	from orders o 
	where o.o_totalprice between 100000 and 100100);
