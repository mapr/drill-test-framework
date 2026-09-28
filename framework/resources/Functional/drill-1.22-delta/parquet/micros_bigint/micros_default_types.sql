-- expected: options off (default) -> columns keep TIME / TIMESTAMP types
select typeof(_TIME_MICROS_int64) t, typeof(_TIMESTAMP_MICROS_int64) ts from `drill-1.22-delta/parquet_micros/microseconds.parquet` limit 1
