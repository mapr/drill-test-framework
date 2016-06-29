explain plan for select * from ( select last_day(create_date) from voter_parquet where voter_id=138 ) t limit 0;
