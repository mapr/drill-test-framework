explain plan for select * from ( select cast(columns[10] as timestamp) - cast(columns[7] as interval day to second) from `interval_data.csv` where columns[0]=4 ) t limit 0;
