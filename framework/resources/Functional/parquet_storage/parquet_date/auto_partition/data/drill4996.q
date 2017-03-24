select i_rec_start_date, i_size from dfs.`/drill/testdata/parquet_date/auto_partition/item_multipart_autorefresh`  group by i_rec_start_date, i_size;
