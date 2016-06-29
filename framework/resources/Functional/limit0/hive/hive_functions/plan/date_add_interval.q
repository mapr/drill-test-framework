explain plan for select * from ( select date_add(create_date, interval '1 10:20:30' DAY to second) from voter_parquet where voter_id=10 ) t limit 0;
