select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intint where (`year`=1993 or `month`=8) and (`year`=1995 or `month`=12);
