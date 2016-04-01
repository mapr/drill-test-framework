explain plan for select * from ( select floor(voter_id),floor(age),floor(contributions),floor(voterzone) from voter_parquet_v where voter_id=15 ) t limit 0;
