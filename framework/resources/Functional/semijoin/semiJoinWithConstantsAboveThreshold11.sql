set `planner.enable_semijoin` = true;
select orders.o_totalprice from orders where orders.o_custkey in (60001,60002,60003,60004,60005,60006,60007,60008,60009,60010,60011,60012,60013,60014,60015,60016,60017,60018,60019,60020,60021) order by orders.o_totalprice limit 10;
reset `planner.enable_semijoin`;
