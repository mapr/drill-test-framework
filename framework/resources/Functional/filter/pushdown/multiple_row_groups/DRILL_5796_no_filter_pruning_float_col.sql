select * from `filter/pushdown/DRILL_5796_test_data.parquet` where not float_col > 0.1 order by id limit 5;
