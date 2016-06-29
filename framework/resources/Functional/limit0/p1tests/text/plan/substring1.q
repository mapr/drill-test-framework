explain plan for select * from ( select substring(name from 3 for 5),substring(registration from 3 for 5) from voter_csv_v where voter_id=10 ) t limit 0;
