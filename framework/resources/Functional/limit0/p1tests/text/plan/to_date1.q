explain plan for select * from ( select to_date(create_time, 'YYYY-MM-dd hh:mm:ss.SSS') from voter_csv_v where voter_id=10 ) t limit 0;
