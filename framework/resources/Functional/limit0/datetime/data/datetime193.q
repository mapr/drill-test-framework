select cast(c_timestamp as timestamp) - cast(c_interval_year as interval year) from `interval_data.parquet` where c_row=4;
