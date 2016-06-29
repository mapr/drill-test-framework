select cast(c_timestamp as timestamp) - cast(c_interval_hour as interval hour) from `interval_data.parquet` where c_row=1;
