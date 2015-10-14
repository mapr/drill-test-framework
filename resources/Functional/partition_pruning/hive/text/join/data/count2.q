select count(*) from hive.orders_text_partitioned_hive o, hive.lineitem_text_partitioned_hive l where o.o_orderkey = l.l_orderkey and o.`year`=1992 and l.`year`=1993;
