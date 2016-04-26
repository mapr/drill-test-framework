explain plan for select * from ( select ceiling(voter_id),ceiling(age),ceiling(contributions),ceiling(voterzone) from voter_csv_v where voter_id=15 ) t limit 0;
