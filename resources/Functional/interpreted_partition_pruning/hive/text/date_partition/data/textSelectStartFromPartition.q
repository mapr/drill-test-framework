select * from hive.lineitem_text_partitioned_hive_date where (dt = date '2014-10-22' and l_orderkey>29600) or (dt = date '2014-10-23' and l_orderkey>29700);
