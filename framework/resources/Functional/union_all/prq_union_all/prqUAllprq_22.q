select col_int, col_bgint from `prqUnAll_0.parquet` union all select col_bgint, col_int from `prqUnAll_1.parquet`;
