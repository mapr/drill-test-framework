explain plan for select * from ( select (voter_id * 2), (age * 2), (contributions * 2) from voter_csv_v where voter_id=10 ) t limit 0;
