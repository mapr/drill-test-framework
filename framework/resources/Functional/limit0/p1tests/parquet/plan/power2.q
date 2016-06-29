explain plan for select * from ( select power(voter_id,3),power(age,2),power(contributions,2),power(voterzone,2) from voter_parquet_v where voter_id=10 ) t limit 0;
