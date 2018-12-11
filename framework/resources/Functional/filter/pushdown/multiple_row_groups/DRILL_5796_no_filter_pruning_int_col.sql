select * from `parquet_storage/DRILL_5796/DRILL_5796_test_data.parquet` where int_col[1] < 0 order by id limit 5;
