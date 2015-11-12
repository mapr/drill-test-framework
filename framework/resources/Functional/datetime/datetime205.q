select c_timestamp + cast(c_interval as interval day to second) from `interval_data.parquet` where c_row = 5;
