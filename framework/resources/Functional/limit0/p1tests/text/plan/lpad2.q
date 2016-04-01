explain plan for select * from ( select lpad(name, 20, 'A'), lpad(registration,15,'B') from voter_csv_v where voter_id=10 ) t limit 0;
