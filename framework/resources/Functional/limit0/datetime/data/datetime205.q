select cast(c_timestamp as timestamp) + cast(c_interval as interval day to second) from `interval_data.parquet` where c_row = 5;
