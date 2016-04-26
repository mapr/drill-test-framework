select cast(columns[0] as integer),cast(columns[10] as timestamp) + interval '1 2:30:45.100' day to second from `interval_data.csv`;
