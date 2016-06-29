explain plan for select * from ( select cast(columns[10] as timestamp) + cast(columns[3] as interval day) from `interval_data.csv` ) t limit 0;
