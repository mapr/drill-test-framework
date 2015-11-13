explain plan for select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.dynamic_partitions.lineitem_text_partitioned_hive_date where dt IN (date '2014-10-22');
