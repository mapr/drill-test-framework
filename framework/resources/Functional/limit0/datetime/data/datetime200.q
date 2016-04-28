select cast(c_timestamp as timestamp) + cast(c_interval_second as interval second) from `interval_data.parquet` where c_row=3;
