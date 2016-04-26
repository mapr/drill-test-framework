explain plan for select * from ( select min(cast(columns[1] as interval year)) from `interval_data.csv` ) t limit 0;
