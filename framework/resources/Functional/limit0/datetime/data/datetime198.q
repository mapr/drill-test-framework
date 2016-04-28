select cast(c_timestamp as timestamp) + cast(c_interval_minute as interval minute) from `interval_data.parquet` where c_row=1;
