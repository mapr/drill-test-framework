select cast(c_time as time) + cast(c_interval as interval day to second) from `interval_data.json` where c_row=4;
