explain plan for select * from ( select count(cast(columns[4] as interval hour)) from `interval_data.csv` ) t limit 0;
