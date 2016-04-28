select cast(c_interval_year as interval year) + cast(c_interval_month as interval month) from `interval_data.json` where c_row=3;
