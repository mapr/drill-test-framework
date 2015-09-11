select t.`trans_info`.keywords from `parquet_storage/DRILL-1818.parquet` t where t.`trans_info`.keywords is not null;
