explain plan for select * from ( select next_day(create_date,'WED') from voter_parquet where voter_id=138 ) t limit 0;
