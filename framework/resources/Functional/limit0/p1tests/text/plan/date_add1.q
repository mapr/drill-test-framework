explain plan for select * from ( select date_add(to_date(create_time,'YYYY-MM-dd HH:mm:ss.SSS'), interval '5' DAY) from voter_csv_v where voter_id=10 ) t limit 0;
