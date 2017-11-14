set `planner.enable_broadcast_join`=false;
set `planner.slice_target`=1;
select * from hbase.customer1 c, cp.`tpch/orders.parquet` o where cast(c.orders.id as bigint) = o.o_orderkey and c.orders.id <= '200';
reset `planner.slice_target`;
reset `planner.enable_broadcast_join`;
