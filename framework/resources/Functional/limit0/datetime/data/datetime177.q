select cast(c_interval as interval day to second) - interval '1 2:30:45.100' day to second from `interval_data.parquet` where c_row=4;
