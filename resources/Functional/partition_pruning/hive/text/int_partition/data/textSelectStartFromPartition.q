select * from hive.lineitem_text_partitioned_hive where (`year`=1993 and l_orderkey>29600) or (`year`=1994 and l_orderkey>29700);
