select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct, `year` from hive.lineitem_text_partitioned_hive where (`year`=1993 and l_orderkey>29600) or (`year`=1994 and l_orderkey>29700);
