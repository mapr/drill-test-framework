explain plan for select * from ( select interval '20:30' minute to second + cast(c_interval_minute as interval minute) from `interval_data.parquet` where c_row=6 ) t limit 0;
