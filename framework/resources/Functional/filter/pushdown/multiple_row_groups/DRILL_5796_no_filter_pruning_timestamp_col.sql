select * from `filter/pushdown/DRILL_5796_test_data.parquet` where ts_col in ('2016-01-09 23:05:45', '2016-01-13 23:09:41', '2016-01-01 22:57:53') order by id limit 5;
