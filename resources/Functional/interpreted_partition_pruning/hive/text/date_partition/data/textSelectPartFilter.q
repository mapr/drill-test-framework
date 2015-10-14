select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_date where dt = date '2014-10-22' and l_orderkey > 29600;
