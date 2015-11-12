select cast(columns[7] as interval day to second) + interval '1 2:30:45.100' day to second from `interval_data.csv` where columns[0]=4;
