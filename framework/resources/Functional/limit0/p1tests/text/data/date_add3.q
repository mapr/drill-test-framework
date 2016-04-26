select date_add(to_date(create_time,'YYYY-MM-dd HH:mm:ss.SSS'), interval '1 10:20:30' DAY to second) from voter_csv_v where voter_id=10;
