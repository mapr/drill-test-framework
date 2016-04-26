select cast(c_date as date) - cast(c_interval as interval year to month) from `interval_data.parquet` where c_row=1;
