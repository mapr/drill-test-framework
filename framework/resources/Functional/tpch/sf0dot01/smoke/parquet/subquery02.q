select c.c_custkey 
  from customer c, 
          (select o.o_custkey as x 
             from orders o 
               where o.o_totalprice between 100000 and 100100) as temp 
 where c.c_custkey = temp.x;
