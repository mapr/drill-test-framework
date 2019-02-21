set `planner.enable_semijoin` = true;
SELECT orders.o_totalprice FROM orders WHERE EXISTS (SELECT 1 FROM customer WHERE customer.c_custkey = orders.o_custkey) order by orders.o_totalprice limit 10;
reset `planner.enable_semijoin`;

