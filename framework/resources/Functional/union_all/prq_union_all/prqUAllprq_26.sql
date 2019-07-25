select col_date, col_tmstmp from `prqUnAll_0.parquet` union all select col_tmstmp, col_date from `prqUnAll_1.parquet`;
