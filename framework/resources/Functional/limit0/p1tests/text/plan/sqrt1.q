explain plan for select * from ( select sqrt(voter_id), sqrt(age),sqrt(contributions),sqrt(voterzone) from voter_csv_v where voter_id=10 ) t limit 0;
