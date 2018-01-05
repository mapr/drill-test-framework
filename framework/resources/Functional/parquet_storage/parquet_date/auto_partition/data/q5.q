select distinct i_rec_end_date from dfs_test.`/drill/testdata/parquet_date/auto_partition/item_single` where dir0='1.9' and i_rec_start_date = date '1997-10-27';
