select l_orderkey, l_partkey, l_quantity, l_shipdate, l_shipinstruct from hive.lineitem_text_partitioned_hive_date where (dt IN (date '2014-10-22') and l_orderkey>29600) or dt IN (date '2014-10-23');
