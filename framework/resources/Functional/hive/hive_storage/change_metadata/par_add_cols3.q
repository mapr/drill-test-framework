select * from changemetadata_orders_partitioned where o_comment is not null or o_orderkey = 3 order by o_orderkey limit 2;
