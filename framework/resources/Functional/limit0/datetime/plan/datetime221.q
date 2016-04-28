explain plan for select * from ( select max(cast(c_interval_day as interval day)) from `interval_data.json` ) t limit 0;
