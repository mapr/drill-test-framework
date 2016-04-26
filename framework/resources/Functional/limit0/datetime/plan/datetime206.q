explain plan for select * from ( select cast(c_timestamp as timestamp) + cast(c_interval as interval hour to second) from `interval_data.json` where c_row=7 ) t limit 0;
