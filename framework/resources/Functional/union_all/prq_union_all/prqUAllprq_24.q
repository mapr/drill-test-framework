select col_dbl, col_int, col_bgint from `prqUnAll_0.parquet` union all select col_int, col_dbl, col_bgint from `prqUnAll_1.parquet`;
