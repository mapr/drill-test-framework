explain plan for select * from ( select date_part('hour',create_time) from voter_csv_v where voter_id=10 ) t limit 0;
