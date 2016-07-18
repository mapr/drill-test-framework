select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intstring where `year`=1993 and abs(l_orderkey) like '2960%' and `month`='nov';
