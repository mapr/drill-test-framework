select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_hier_intint where (`year` IN (1993) and l_orderkey>29600) or `month` IN (12);
