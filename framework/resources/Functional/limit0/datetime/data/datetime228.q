select cast(c_interval_day as interval day) + cast(c_interval_minute as interval minute) + cast(c_interval_second as interval second) from `interval_data.json`;
