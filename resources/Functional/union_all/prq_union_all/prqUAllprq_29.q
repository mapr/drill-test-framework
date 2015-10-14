select col_tmstmp, col_date, col_boln from `prqUnAll_0.parquet` union all select col_date, col_tmstmp, col_boln from `prqUnAll_1.parquet`;
