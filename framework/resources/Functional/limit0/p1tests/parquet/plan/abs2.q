explain plan for select * from ( select abs(voter_id), abs(age), abs(contributions),abs(voterzone) from voter_parquet_v where abs(voter_id)=10 ) t limit 0;
