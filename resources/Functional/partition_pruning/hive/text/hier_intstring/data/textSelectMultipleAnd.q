select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intstring where (`year`=1993 or `month`='aug') and (`year`=1995 or `month`='dec');
