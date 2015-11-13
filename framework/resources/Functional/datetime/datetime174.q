select columns[0],cast(columns[10] as timestamp) + interval '1 2:30:45.100' day to second from `interval_data.csv`;
