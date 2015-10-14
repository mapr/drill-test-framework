select * from (select col_boln from `prqUnAll_0.parquet` union all select col_boln from `prqUnAll_1.parquet`) tmp where tmp.col_boln in (true,false) limit 20;
