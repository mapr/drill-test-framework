explain plan for select * from ( select cast(columns[1] as interval year) + cast(columns[2] as interval month) from `interval_data.csv` where columns[0]=2 ) t limit 0;
