( SELECT col_bgint, col_int FROM `prqUnAll_0.parquet` WHERE 1=0 ) UNION ALL ( SELECT col_bgint, col_int FROM `prqUnAll_1.parquet` ORDER BY col_int LIMIT 20 );
