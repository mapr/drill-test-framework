select count(*) from dfs.`/drill/testdata/parquet_date/auto_partition/lineitem_single` where dir0='1.2' and l_moddate = date '1996-03-01';
