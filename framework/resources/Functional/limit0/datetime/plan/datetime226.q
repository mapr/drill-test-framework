explain plan for select * from ( select count(cast(c_interval_minute as interval minute)) from `interval_data.json` where cast(c_interval_minute as interval minute) > interval '5' minute ) t limit 0;
