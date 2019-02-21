set `planner.enable_semijoin` = true;
select orders.o_totalprice from orders where orders.o_custkey in (60001,60002,60003,60004,60005,60006,60007,60008,60009,60010) order by orders.o_totalprice limit 10;
reset `planner.enable_semijoin`;
