select to_date(unix_timestamp(l_shipdate, 'yyyy-MM-dd')*1000) from hive.tpch01_parquet_nodate.lineitem;
