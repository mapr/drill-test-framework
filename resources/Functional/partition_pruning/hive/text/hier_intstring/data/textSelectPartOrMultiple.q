select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intstring where (`year`=1993 and `month`='oct') or (`year`=1994 and `month`='may');
