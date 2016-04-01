explain plan for select * from ( select interval '20:30' minute to second - cast(c_interval_second as interval second) from `interval_data.json` where c_row = 3 ) t limit 0;
