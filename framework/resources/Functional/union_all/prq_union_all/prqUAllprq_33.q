select count(*) from (select col_date from `prqUnAll_0.parquet` union all select col_date from `prqUnAll_1.parquet` ) tmp;
