select cast(columns[10] as timestamp) + cast(columns[4] as interval hour) from `interval_data.csv`;
