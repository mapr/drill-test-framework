set `planner.enable_broadcast_join`=false;
select * from hbase.customer2 c, cp.`tpch/orders.parquet` o where cast(c.orders.id as bigint) = o.o_orderkey and c.orders.id <= '500';
reset `planner.enable_broadcast_join`;
