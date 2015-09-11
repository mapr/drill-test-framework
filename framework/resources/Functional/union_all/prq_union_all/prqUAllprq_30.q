select count(col_date) count_date, col_boln from `prqUnAll_0.parquet` group by col_boln union all select count(col_date) count_date, col_boln from `prqUnAll_1.parquet` group by col_boln;
