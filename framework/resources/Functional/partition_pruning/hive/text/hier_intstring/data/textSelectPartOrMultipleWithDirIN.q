select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct, `year`, `month` from hive.lineitem_text_partitioned_hive_hier_intstring where (`year` IN (1993) and `month`='oct') or (`year` IN (1994) and `month`='may');
