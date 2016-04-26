explain plan for select * from ( select div(voter_id,3),div(age,4),div(contributions,15) from voter_csv_v where voter_id=10 ) t limit 0;
