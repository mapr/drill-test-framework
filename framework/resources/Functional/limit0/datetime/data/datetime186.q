select cast(c_interval as interval hour to second) - cast(c_interval_minute as interval minute) from `interval_data.json` where c_row = 6;
