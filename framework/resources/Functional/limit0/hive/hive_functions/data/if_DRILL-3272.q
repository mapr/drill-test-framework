select if(`year`(l_shipdate) > 2000, 'latest', 'old') from hive.tpch01_parquet_nodate.lineitem;
