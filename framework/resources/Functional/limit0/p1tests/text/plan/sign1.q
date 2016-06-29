explain plan for select * from ( select sign(voter_id),sign(age),sign(contributions),sign(voterzone) from voter_csv_v where voter_id=10 ) t limit 0;
