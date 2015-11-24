select interval '2 10:20:30' day to second + cast(c_interval_day as interval day) from `interval_data.parquet` where c_row=4;
