explain plan for select * from ( select ceil(voter_id),ceil(age),ceil(contributions),ceil(voterzone) from voter_parquet_v where voter_id=15 ) t limit 0;
