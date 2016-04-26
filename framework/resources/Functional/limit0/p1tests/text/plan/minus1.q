explain plan for select * from ( select (voter_id -3),(age - voter_id),(contributions - 10),(voterzone - 1000) from voter_csv_v where voter_id=10 ) t limit 0;
