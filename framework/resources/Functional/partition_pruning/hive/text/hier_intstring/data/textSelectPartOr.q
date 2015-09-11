select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intstring where (`year`=1993 and `month`='dec' and l_orderkey>29600) or `year`=1994;
