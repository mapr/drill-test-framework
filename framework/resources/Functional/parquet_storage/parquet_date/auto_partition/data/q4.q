select l_shipdate from dfs.`/drill/testdata/parquet_date/auto_partition/lineitem_single` where dir0='1.6' and l_moddate = date '1996-03-01';
